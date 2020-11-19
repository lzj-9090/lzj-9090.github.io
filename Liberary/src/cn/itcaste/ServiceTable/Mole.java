package cn.itcaste.ServiceTable;

public class Mole {
    private String Chuan;
    private Object zhi;
    private boolean pan;

    public Mole(String chuan, Object zhi, boolean pan) {
        Chuan = chuan;
        this.zhi = zhi;
        this.pan = pan;
    }

    public String getChuan() {
        return Chuan;
    }

    public void setChuan(String chuan) {
        Chuan = chuan;
    }

    public Object getZhi() {
        return zhi;
    }

    public void setZhi(Object zhi) {
        this.zhi = zhi;
    }

    public boolean isPan() {
        return pan;
    }

    public void setPan(boolean pan) {
        this.pan = pan;
    }

    public Mole() {
    }
}
