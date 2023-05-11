Imports System.Data.SqlClient

Public Class Deleverd
    Inherits System.Web.UI.Page
    Private con As New Connection
    Private com As New SqlCommand
    Private dt As New DataTable
    Private discaprvl As DataTable
    Private adp As New SqlDataAdapter

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dt = con.ReturnDtTable("Select DISTINCT row_number() over (order by ledg_name asc) As srNo, DMS_Inv As Invoice_Number, convert(varchar,Delv_Date,103) As Delivery_Date, Ledg_Name As Ledger_Name,  Upper((Select top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) As Models,ICM_Mst.CHAS_No As Chassis_Number ,  (Select top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal as Net_balance from ICM_MST where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51")
        DevelerdData.DataSource = dt
        For i As Integer = 0 To dt.Rows.Count - 1
            dt.Rows(i)("srNo") = i + 1
        Next
        DevelerdData.DataBind()
    End Sub

    Protected Sub ViewFilterData_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ViewFilterData.Click
        FilterData(Search.Text)
    End Sub

    Public Sub FilterData(ValueToSearch As String)
        dt = con.ReturnDtTable("select DISTINCT row_number() over (order by ledg_name asc) as srNo, DMS_Inv as Invoice_Number, convert(varchar,Delv_Date,103) as Delivery_Date, Ledg_Name as Ledger_Name,  Upper((SElect top 1 model from NewCar_Sale_Register where ICM_Id=Tran_Id)) as Models,ICM_Mst.CHAS_No as Chassis_Number ,  (SElect top 1 EMPCODE+'-'+EmpFirstName+' '+IsNull(EmpLastName,'') from EmployeeMaster where  SrNo=ERP_DSE) as DSE_Name,Cust_Id as Customer_Id,Net_Bal as Net_balance from ICM_MST where ISNull(Veh_Del,0)=1 and ICM_MST.Export_Type<3 and  ICM_MST.tran_type=51 and CONCAT(INV_No, Delv_Date, Ledg_Name) like '%" & ValueToSearch & "%' ")
        DevelerdData.DataSource = dt
        DevelerdData.DataBind()
    End Sub

End Class