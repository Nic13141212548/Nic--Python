$SQL_BUFF[0]=qq(
set mapreduce.job.name=a_jf_csf_jc_detail_daily_a_d_00;
use app;
create table if not exists app.a_jf_finmod_scf_incom_fee_i_m
(
  dim_month_dt              string comment '月份'
  ,prod_code                string comment '业务类型编码'
  ,prod_name                string comment '业务类型名称'
  ,prod_lvl                 string comment '业务类型层级编号'
  ,last_prod_code           string comment '上级业务类型编号' 
  ,fore_end_seq             bigint comment '前端展示顺序'
  ,data_get_md_code         string comment '数据获取方式编码' 
  ,data_get_md_name         string comment '数据获取方式描述' 
  ,avg_amt                  double comment '日均余额'
  ,annual_y_roi             double comment '年化收益率'
  ,int_incom                double comment '利息收入'
  ,mid_incom                double comment '中间收入'
  ,sum_incom                double comment '收入合计'
  ,int_roi                  double comment '付息率'
  ,cost_of_cap              double comment '资金成本'
  ,nim                      double comment 'NIM'
  ,cur_loss_exp             double comment '当期资损费用'
  ,90_reject_roi            double comment '90+不良率'
  ,dep_other_fee            double comment '部门其他费用'
  ,cost                     double comment '成本'
  ,dayofyear                double comment '天数/365'
)
comment '供应链主模型表'
partitioned by (dt string comment '日期')
;
)
;

$SQL_BUFF[1]=qq(
set mapreduce.job.name=a_jf_csf_jc_detail_daily_a_d_01;
use tmp;
create table if not exists tmp.a_jf_finmod_scf_incom_fee_i_m_0 as
select *
from dwb.DWB_LOAN_ORDR_DET_JF_S_D
where dt='2018-03-01' and loan_id is null
;
)
;



$SQL_BUFF[2]=qq(
set mapreduce.job.name=a_jf_csf_jc_detail_daily_a_d_02;
use app;
TRUNCATE TABLE app.a_jf_finmod_scf_incom_fee_i_m;
insert into table app.a_jf_finmod_scf_incom_fee_i_m partition(dt) select '2018-03','ALL','合计','1','','0','1','实际发生','44506.91','87.67%','3313.94','4.22','3318.16','28.24%','1067.4','1.07%','11.07','1.87%','10.41','1088.88','0.08','2018-03-01' from tmp.dual;


#ceshi githube bianji