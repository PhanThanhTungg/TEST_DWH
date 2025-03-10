USE DataWarehouse;
CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             NVARCHAR(50),
    cst_firstname       NVARCHAR(50),
    cst_lastname        NVARCHAR(50),
    cst_marital_status  NVARCHAR(50),
    cst_gndr            NVARCHAR(50),
    cst_create_date     DATE
);
GO

CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      NVARCHAR(50),
    prd_nm       NVARCHAR(50),
    prd_cost     INT,
    prd_line     NVARCHAR(50),
    prd_start_dt DATETIME, -- ngày bắt đầu bán
    prd_end_dt   DATETIME -- ngày kết thúc bán, nếu trống thì là vẫn đang bán
);
GO

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  NVARCHAR(50),
    sls_prd_key  NVARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt INT, -- ngày đặt hàng
    sls_ship_dt  INT, -- ngày giao hàng dự kiến
    sls_due_dt   INT, -- ngày đáo hạn của đơn hàng
    sls_sales    INT, -- tổng doanh thu của đơn
    sls_quantity INT, 
    sls_price    INT
);
GO

CREATE TABLE bronze.erp_loc_a101 ( -- bảng này chứa thông tin vị trí của kh
    cid    NVARCHAR(50),
    cntry  NVARCHAR(50)
);
GO


CREATE TABLE bronze.erp_cust_az12 (
    cid    NVARCHAR(50),
    bdate  DATE,
    gen    NVARCHAR(50)
);
GO

CREATE TABLE bronze.erp_px_cat_g1v2 ( -- bảng này chứa thông tin danh mục
    id           NVARCHAR(50),
    cat          NVARCHAR(50), -- nhóm danh mục chính
    subcat       NVARCHAR(50), -- nhóm danh mục phụ
    maintenance  NVARCHAR(50) -- có yêu cầu bảo trì hay không sao 1 thời gian sd ko
);
GO
