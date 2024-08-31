using {SM.local_content_backend.db as db} from '../db/schema';

service lc_report_service {
    entity LC_HeaderT                as projection on db.LC_HeaderT;
    entity GoodsWorkServicePurchaseT as projection on db.GoodsWorkServicePurchaseT;
    entity LC_CalculationReportT     as projection on db.LC_CalculationReportT;
    entity ContractorReportT         as projection on db.ContractorReportT;
    entity ROK_CTZN_Employee_ReportT as projection on db.ROK_CTZN_Employee_ReportT;
    entity EmployeeInWKOT            as projection on db.EmployeeInWKOT;
    entity FeedbackReviewLogs        as projection on db.FeedbackReviewLogs;
}
