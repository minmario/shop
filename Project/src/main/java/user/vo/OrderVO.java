package user.vo;

import java.util.List;

public class OrderVO {
    private String id, tid, cus_no, prod_no, coupon_no, deli_no, order_code, count, order_date,
            pay_type, order_bank, order_account, card_name, is_install, install_month, status, refund_bank, refund_account, reason, retrieve_deli_no, prod_code, prod_name, prod_price,
            prod_sale, prod_image, prod_saled_price, brand, option_name, deli_name, pos_code, addr1, addr2, phone, deli_request, is_default, point_amount;
    private List<OrderVO> list;

    public String getRetrieve_deli_no() {
        return retrieve_deli_no;
    }

    public void setRetrieve_deli_no(String retrieve_deli_no) {
        this.retrieve_deli_no = retrieve_deli_no;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getPoint_amount() {
        return point_amount;
    }

    public String getIs_default() {
        return is_default;
    }

    public void setIs_default(String is_default) {
        this.is_default = is_default;
    }

    public String getRefund_bank() {
        return refund_bank;
    }

    public void setRefund_bank(String refund_bank) {
        this.refund_bank = refund_bank;
    }

    public String getRefund_account() {
        return refund_account;
    }

    public void setRefund_account(String refund_account) {
        this.refund_account = refund_account;
    }

    public void setPoint_amount(String point_amount) {
        this.point_amount = point_amount;
    }

    public String getDeli_name() {
        return deli_name;
    }

    public void setDeli_name(String deli_name) {
        this.deli_name = deli_name;
    }

    public String getPos_code() {
        return pos_code;
    }

    public void setPos_code(String pos_code) {
        this.pos_code = pos_code;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getDeli_request() {
        return deli_request;
    }

    public void setDeli_request(String deli_request) {
        this.deli_request = deli_request;
    }

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

    public String getOrder_bank() {
        return order_bank;
    }

    public void setOrder_bank(String order_bank) {
        this.order_bank = order_bank;
    }

    public String getOrder_account() {
        return order_account;
    }

    public void setOrder_account(String order_account) {
        this.order_account = order_account;
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
