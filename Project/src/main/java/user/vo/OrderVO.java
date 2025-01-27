package user.vo;

import java.util.List;

public class OrderVO {
    private String id, tid, cus_no, prod_no, coupon_no, point_no, deli_no, order_code, count, order_date,
            pay_type, bank, account, card_name, is_install, install_month, status, prod_code, prod_name, prod_price,
            prod_sale, prod_image, prod_saled_price, brand, option_name;
    private List<OrderVO> list;

    public String getOption_name() {
        return option_name;
    }

    public void setOption_name(String option_name) {
        this.option_name = option_name;
    }

    public String getProd_code() {
        return prod_code;
    }

    public void setProd_code(String prod_code) {
        this.prod_code = prod_code;
    }

    public String getProd_name() {
        return prod_name;
    }

    public void setProd_name(String prod_name) {
        this.prod_name = prod_name;
    }

    public String getProd_price() {
        return prod_price;
    }

    public void setProd_price(String prod_price) {
        this.prod_price = prod_price;
    }

    public String getProd_sale() {
        return prod_sale;
    }

    public void setProd_sale(String prod_sale) {
        this.prod_sale = prod_sale;
    }

    public String getProd_image() {
        return prod_image;
    }

    public void setProd_image(String prod_image) {
        this.prod_image = prod_image;
    }

    public String getProd_saled_price() {
        return prod_saled_price;
    }

    public void setProd_saled_price(String prod_saled_price) {
        this.prod_saled_price = prod_saled_price;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public List<OrderVO> getList() {
        return list;
    }

    public void setList(List<OrderVO> list) {
        this.list = list;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getCus_no() {
        return cus_no;
    }

    public void setCus_no(String cus_no) {
        this.cus_no = cus_no;
    }

    public String getProd_no() {
        return prod_no;
    }

    public void setProd_no(String prod_no) {
        this.prod_no = prod_no;
    }

    public String getCoupon_no() {
        return coupon_no;
    }

    public void setCoupon_no(String coupon_no) {
        this.coupon_no = coupon_no;
    }

    public String getPoint_no() {
        return point_no;
    }

    public void setPoint_no(String point_no) {
        this.point_no = point_no;
    }

    public String getDeli_no() {
        return deli_no;
    }

    public void setDeli_no(String deli_no) {
        this.deli_no = deli_no;
    }

    public String getOrder_code() {
        return order_code;
    }

    public void setOrder_code(String order_code) {
        this.order_code = order_code;
    }

    public String getCount() {
        return count;
    }

    public void setCount(String count) {
        this.count = count;
    }

    public String getOrder_date() {
        return order_date;
    }

    public void setOrder_date(String order_date) {
        this.order_date = order_date;
    }

    public String getPay_type() {
        return pay_type;
    }

    public void setPay_type(String pay_type) {
        this.pay_type = pay_type;
    }

    public String getBank() {
        return bank;
    }

    public void setBank(String bank) {
        this.bank = bank;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getCard_name() {
        return card_name;
    }

    public void setCard_name(String card_name) {
        this.card_name = card_name;
    }

    public String getIs_install() {
        return is_install;
    }

    public void setIs_install(String is_install) {
        this.is_install = is_install;
    }

    public String getInstall_month() {
        return install_month;
    }

    public void setInstall_month(String install_month) {
        this.install_month = install_month;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
