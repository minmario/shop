package comm.vo;

public class ProductVO {
    private String id;
    private String category_no;
    private String seller_no;
    private String name;
    private String length;
    private String shoulder;
    private String chest;
    private String sleeve;
    private String waist;
    private String hip;
    private String thigh;
    private String rise;
    private String hem;
    private String foot_length;
    private String foot_width;
    private String ankle_height;
    private String heel_height;
    private String price;
    private String add_date;
    private String view_count;
    private String inventory;
    private String active;
    private String sale;
    private String prod_image;
    private String additional_images;
    private String is_del;
    private String saled_price;

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    private String content;
    private String[] ar_images;
    private InventoryVO[] options;

    public String[] getAr_images() {
        return ar_images;
    }

    public void setAr_images(String[] ar_images) {
        this.ar_images = ar_images;
    }

    public String getAdditional_images() {
        return additional_images;
    }

    public void setAdditional_images(String additional_images) {
        this.additional_images = additional_images;
    }

    public String getSaled_price() {
        return saled_price;
    }

    public void setSaled_price(String saled_price) {
        this.saled_price = saled_price;
    }



    public InventoryVO[] getOptions() {
        return options;
    }

    public void setOptions(InventoryVO[] options) {
        this.options = options;
    }

    public String getIs_del() {
        return is_del;
    }

    public void setIs_del(String is_del) {
        this.is_del = is_del;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCategory_no() {
        return category_no;
    }

    public void setCategory_no(String category_no) {
        this.category_no = category_no;
    }

    public String getSeller_no() {
        return seller_no;
    }

    public void setSeller_no(String seller_no) {
        this.seller_no = seller_no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLength() {
        return length;
    }

    public void setLength(String length) {
        this.length = length;
    }

    public String getShoulder() {
        return shoulder;
    }

    public void setShoulder(String shoulder) {
        this.shoulder = shoulder;
    }

    public String getChest() {
        return chest;
    }

    public void setChest(String chest) {
        this.chest = chest;
    }

    public String getSleeve() {
        return sleeve;
    }

    public void setSleeve(String sleeve) {
        this.sleeve = sleeve;
    }

    public String getWaist() {
        return waist;
    }

    public void setWaist(String waist) {
        this.waist = waist;
    }

    public String getHip() {
        return hip;
    }

    public void setHip(String hip) {
        this.hip = hip;
    }

    public String getThigh() {
        return thigh;
    }

    public void setThigh(String thigh) {
        this.thigh = thigh;
    }

    public String getRise() {
        return rise;
    }

    public void setRise(String rise) {
        this.rise = rise;
    }

    public String getHem() {
        return hem;
    }

    public void setHem(String hem) {
        this.hem = hem;
    }

    public String getFoot_length() {
        return foot_length;
    }

    public void setFoot_length(String foot_length) {
        this.foot_length = foot_length;
    }

    public String getFoot_width() {
        return foot_width;
    }

    public void setFoot_width(String foot_width) {
        this.foot_width = foot_width;
    }

    public String getAnkle_height() {
        return ankle_height;
    }

    public void setAnkle_height(String ankle_height) {
        this.ankle_height = ankle_height;
    }

    public String getHeel_height() {
        return heel_height;
    }

    public void setHeel_height(String heel_height) {
        this.heel_height = heel_height;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getAdd_date() {
        return add_date;
    }

    public void setAdd_date(String add_date) {
        this.add_date = add_date;
    }

    public String getView_count() {
        return view_count;
    }

    public void setView_count(String view_count) {
        this.view_count = view_count;
    }

    public String getInventory() {
        return inventory;
    }

    public void setInventory(String inventory) {
        this.inventory = inventory;
    }

    public String getActive() {
        return active;
    }

    public void setActive(String active) {
        this.active = active;
    }

    public String getSale() {
        return sale;
    }

    public void setSale(String sale) {
        this.sale = sale;
    }

    public String getProd_image() {
        return prod_image;
    }

    public void setProd_image(String prod_image) {
        this.prod_image = prod_image;
    }

}
