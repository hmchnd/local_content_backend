namespace SM.local_content_backend.db;

using {
    cuid,
    managed
} from '@sap/cds/common';

entity LC_HeaderT : cuid, managed {
    key ID                  : UUID;
        vendorID            : String;
        contractNo          : String;
        reportingPeriod     : String;
        status              : String;
        gwsReport           : Composition of many GoodsWorkServicePurchaseT
                                  on gwsReport.parentKey = $self;
        lcReport            : Composition of many LC_CalculationReportT
                                  on lcReport.parentKey = $self;
        contractorReport    : Composition of many ContractorReportT
                                  on contractorReport.parentKey = $self;
        rokCtznEmpReport    : Composition of many ROK_CTZN_Employee_ReportT
                                  on rokCtznEmpReport.parentKey = $self;
        employeeInWokReport : Composition of many EmployeeInWKOT
                                  on employeeInWokReport.parentKey = $self;
}
// Report 1 to get the insights from suppliers for their goods work  and service purchase from local for the contract

entity GoodsWorkServicePurchaseT :cuid,  managed {
    key parentKey                     : Association to LC_HeaderT;
        purchaseCode                  : String;
        purchaseMethod                : String;
        contractNumber                : String;
        contractSubject               : String;
        contractAwardDate             : String;
        contractExpireDate            : String;
        totalContractValueWOVAT       : Decimal(15,2);
        legalEntity                   : String;
        country                       : String;
        supplierName                  : String;
        BIN                           : String;
        supplierAddress               : String;
        GWSCode                       : String;
        nameOfGoodWorkService         : String;
        UOM                           : String;
        procurementScope              : String;
        actualAmountExVat             : Decimal(15,2);
        registrationNumber            : String;
        localGoodsManufacturerBin     : String;
        CT_KZ_Cert_Num                : String;
        dateOfCertIssue               : String;
        localContentInGoodsPercentage : Decimal(15,2);
        localContentInWorkPercentage  : Decimal(15,2);
}


// Report 2 - LC Calculation

entity LC_CalculationReportT : cuid, managed {
    key parentKey                     : Association to LC_HeaderT;
        companyName                   : String;
        nameOfGoodService             : String;
        UOM                           : String;
        volumeOfPurchase              : Decimal;
        actualVolumeExVat             : Decimal;
        localContentInTenge           : Decimal;
        localContentInGoodsPercentage : Decimal;
        localContentInWorkPercentage  : Decimal;
        localGoodsManufacturer        : String;
        localGoodsManufacturerBin     : String;
        GWSCode                       : String;
        CT_KZ_Cert_Num                : String;
        dateOfCertIssue               : String;
        regionOfManufacturer          : String;
}


// Report 3 - Number of Contractors report

entity ContractorReportT : cuid, managed {
    key parentKey         : Association to LC_HeaderT;
        companyName       : String;
        reportingPeriod   : String;
        totalEmployee     : Integer64;
        ROK_ctzn_Employee : Integer64;
}

// Report 4 -RoK Citizen employees payroll report

entity ROK_CTZN_Employee_ReportT : cuid, managed {
    key parentKey                      : Association to LC_HeaderT;
        companyName                    : String;
        reportingPeriod                : String;
        totalPayrollEmployeePercentage : Decimal;
        share_of_rok_ctzn_emp_payroll  : Decimal;
}


// Report 5 - Number of employees involved in KPO Activities in WKO report

entity EmployeeInWKOT : cuid, managed {
    key parentKey                : Association to LC_HeaderT;
        companyName              : String;
        reportingPeriod          : String;
        totalEmployee            : Integer64;
        rokEmployeeInvolvedInWKO : Integer64;
        foreignEmpInvolvedInWKO  : Integer64;
}
