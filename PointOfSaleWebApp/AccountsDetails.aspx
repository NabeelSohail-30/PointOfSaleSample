<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AccountsDetails.aspx.cs" Inherits="PointOfSaleWebApp.AccountsDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/Global.css" rel="stylesheet" />
    <title>Chart of Account</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="banner">
                <img src="Images/chart-of-account.jpeg" alt="" class="banner-img">
            </div>
        </div>

        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="col d-flex justify-content-center">
                        <asp:Label ID="lblContentHeading" runat="server" Text="Chart of Accounts" CssClass="lbl_ContentHeading"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:Panel ID="panelAdd" runat="server" CssClass="panel">
                            <div class="container mt-3">
                                <div class="row">

                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Account Id</label>
                                            <asp:TextBox ID="AccId" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Account Title</label>
                                            <asp:TextBox ID="AccTitle" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Opening Balance</label>
                                            <asp:TextBox ID="OpnBal" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Balance Type</label>
                                            <asp:DropDownList ID="BalType" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceBalType" DataTextField="AccBalanceType" DataValueField="AccBalanceTypeId"></asp:DropDownList>
                                        </div>
                                    </div>

                                </div>

                                <div class="row">

                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Nature</label>
                                            <asp:TextBox ID="Nature" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Sales Tax (Percent)</label>
                                            <asp:TextBox ID="STax" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">NTN</label>
                                            <asp:TextBox ID="NTN" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Phone</label>
                                            <asp:TextBox ID="Phone" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Account Type</label>
                                            <asp:DropDownList ID="AccType" runat="server" CssClass="form-control" DataSourceID="SqlDataSourceAccType" DataTextField="AccountType" DataValueField="AccountTypeId"></asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-8">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Address</label>
                                            <asp:TextBox ID="Address" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Leave Account</label>
                                            <asp:CheckBox ID="LeaveAc" runat="server" CssClass="form-control"></asp:CheckBox>
                                        </div>

                                    </div>

                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Active Account</label>
                                            <asp:CheckBox ID="ActiveAc" runat="server" CssClass="form-control"></asp:CheckBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-flex justify-content-center mt-2">
                                    <div class="col-2">
                                        <div class="form-group">
                                            <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Save" OnClick="btnAdd_Click"></asp:Button>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-flex justify-content-center mt-2">
                                    <div class="col-2">
                                        <div class="form-group d-flex justify-content-center">
                                            <asp:Button ID="btnCancel" runat="server" CssClass="btn mr-2" Text="Cancel" OnClick="btnCancel_Click"></asp:Button>
                                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn ml-2" Text="Update" OnClick="btnUpdate_Click"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountId" DataSourceID="SqlDataSource1" CssClass="grid" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:TemplateField HeaderText="Account Id">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("AccountId") %>' Text='<%# Bind("AccountId") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="AccountTitle" HeaderText="Account Title" SortExpression="AccountTitle" />
                                <asp:BoundField DataField="OpeningBalance" HeaderText="Opening Balance" SortExpression="OpeningBalance" />
                                <asp:BoundField DataField="Nature" HeaderText="Nature" SortExpression="Nature" />
                                <asp:BoundField DataField="STax" HeaderText="Sales Tax %" SortExpression="STax" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </main>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" DeleteCommand="DELETE FROM [AccountsDetails] WHERE [AccountId] = @AccountId" SelectCommand="SELECT [AccountId], [AccountTitle], [OpeningBalance], [Nature], [STax] FROM [AccountsDetails]">
            <DeleteParameters>
                <asp:Parameter Name="AccountId" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceAccType" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" SelectCommand="SELECT * FROM [AccountType]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceBalType" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" SelectCommand="SELECT * FROM [AccBalanceType]"></asp:SqlDataSource>
    </form>
</body>
</html>
