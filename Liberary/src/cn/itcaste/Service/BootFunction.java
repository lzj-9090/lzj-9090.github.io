package cn.itcaste.Service;

import cn.itcaste.ServiceTable.Mole;
import cn.itcaste.dao.BookDAO;
import cn.itcaste.dao.SituationDAO;
import cn.itcaste.table.Book;
import cn.itcaste.table.Situation;

public class BootFunction {
    /**
     * 这他妈的是还没收藏时
     * @param situation1
     * @return
     */
    public static Mole NotRepeat(Situation situation1){
        Mole mole=new Mole();
        Situation situation2= SituationDAO.Select2(situation1.getEmail(),situation1.getBookName(),situation1.getSubscribe());
        Book book=BookDAO.Select4(situation1.getBookName());
        if (situation2==null){
            if(situation1.getSubscribe()==1){
                if(book.getNumber()>0) {//判断书是否定光
                    boolean b = SituationDAO.Insert(situation1);//添加到用户书籍
                    //修改book库存的值
                    boolean b1 = BookDAO.Update1(situation1.getBookName(), book.getNumber() - situation1.getSubscribe());
                        if (b1&&b) {
                            mole.setChuan("订阅成功");
                        } else {
                            mole.setChuan("订阅失败");
                        }

                }else {
                    mole.setChuan("很遗憾，该书已经被订购光！");
                }
            }else {
                //添加到收藏中
                boolean b1=SituationDAO.Insert(situation1);
                if (b1){
                    mole.setChuan("收藏成功");
                }else {
                    mole.setChuan("收藏失败");
                }
            }
        }else {
            mole.setChuan("你已经订购或收藏"+situation1.getBookName());
        }
        return mole;
    }
    /**
     * 收藏操作
     */
    public static Mole CollectionButton(Situation situation){
        Mole mole=new Mole();
        Book book=BookDAO.Select4(situation.getBookName());
        Situation situation1=new Situation(situation.getEmail(),situation.getBookName(),1);
        Situation situation2= SituationDAO.Select2(situation1.getEmail(),situation1.getBookName(),situation1.getSubscribe());
        if (situation2==null){
            boolean b2 = BookDAO.Update1(situation1.getBookName(), book.getNumber() -1);
            if (b2){
                boolean b1=SituationDAO.Update(situation,1);
                mole.setChuan("订购成功");
            }else {
                mole.setChuan("订购失败");
            }
        }else {
            mole.setChuan("你已经订购");
        }
        return mole;
    }
    /**
     * 收藏当中的删除操作
     */
    public static Mole DeleteCollection(Situation situation){
        Mole mole=new Mole();
        if(SituationDAO.Delete(situation)){
            mole.setChuan("删除成功");
        }else {
            mole.setChuan("删除失败");
        }
        return mole;
    }

}
