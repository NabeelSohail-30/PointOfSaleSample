<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SalesInvoice.aspx.cs" Inherits="PointOfSaleWebApp.SalesInvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/Global.css" rel="stylesheet" />
    <title>Sales Invoice</title>
</head>
<body>
    <form id="form1" runat="server">
        <header>
            <asp:Button runat="server" Text="Exit" OnClick="Unnamed1_Click" CssClass="btn-exit"/>
        </header>

        <div>
            <div class="banner">
                <img src="Images/sales.jpg" alt="" class="banner-img">
            </div>
        </div>

        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="col d-flex justify-content-center">
                        <asp:Label ID="lblContentHeading" runat="server" Text="Sales Invoice" CssClass="lbl_ContentHeading"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:Panel ID="panelAdd" runat="server" CssClass="panel w-50 m-auto">
                            <div class="container mt-3 w-85">
                                <div class="row">
                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Item Code</label>
                                            <asp:DropDownList ID="ItemCode" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="ItemCode" DataValueField="ItemCode"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-8">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Description</label>
                                            <asp:TextBox ID="Desc" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Qty</label>
                                            <asp:TextBox ID="Qty" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Unit</label>
                                            <asp:TextBox ID="Unit" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Price</label>
                                            <asp:TextBox ID="Rate" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Total Price</label>
                                            <asp:TextBox ID="Amount" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row d-flex justify-content-center mt-2">
                                    <div class="col-2">
                                        <div class="form-group">
                                            <asp:Button ID="btnAdd" runat="server" CssClass="btn" Text="Add"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>


                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" CssClass="grid" AutoGenerateColumns="False" DataKeyNames="Ref" DataSourceID="SqlDataSource2">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" />
                                <asp:BoundField DataField="ItemCodeId" HeaderText="ItemCodeId" SortExpression="ItemCodeId" />
                                <asp:BoundField DataField="ItemDescription" HeaderText="ItemDescription" SortExpression="ItemDescription" />
                                <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                                <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                                <asp:BoundField DataField="Rate" HeaderText="Rate" SortExpression="Rate" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>


            </div>
        </main>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" SelectCommand="SELECT * FROM [ItemsDetails]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" DeleteCommand="DELETE FROM [SalesDetails] WHERE [Ref] = @Ref" InsertCommand="INSERT INTO [SalesDetails] ([Ref], [Date], [ItemCodeId], [ItemDescription], [Qty], [Unit], [Rate], [Amount], [PartyAcId], [CreditAc], [Description], [Gross], [SalesTax], [TotalQty], [Net]) VALUES (@Ref, @Date, @ItemCodeId, @ItemDescription, @Qty, @Unit, @Rate, @Amount, @PartyAcId, @CreditAc, @Description, @Gross, @SalesTax, @TotalQty, @Net)" SelectCommand="SELECT * FROM [SalesDetails]" UpdateCommand="UPDATE [SalesDetails] SET [Date] = @Date, [ItemCodeId] = @ItemCodeId, [ItemDescription] = @ItemDescription, [Qty] = @Qty, [Unit] = @Unit, [Rate] = @Rate, [Amount] = @Amount, [PartyAcId] = @PartyAcId, [CreditAc] = @CreditAc, [Description] = @Description, [Gross] = @Gross, [SalesTax] = @SalesTax, [TotalQty] = @TotalQty, [Net] = @Net WHERE [Ref] = @Ref">
            <DeleteParameters>
                <asp:Parameter Name="Ref" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Ref" Type="String" />
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="ItemCodeId" Type="Int32" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="Qty" Type="Int32" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="Rate" Type="Double" />
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter Name="PartyAcId" Type="Int32" />
                <asp:Parameter Name="CreditAc" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Gross" Type="Decimal" />
                <asp:Parameter Name="SalesTax" Type="Decimal" />
                <asp:Parameter Name="TotalQty" Type="Int32" />
                <asp:Parameter Name="Net" Type="Decimal" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter DbType="Date" Name="Date" />
                <asp:Parameter Name="ItemCodeId" Type="Int32" />
                <asp:Parameter Name="ItemDescription" Type="String" />
                <asp:Parameter Name="Qty" Type="Int32" />
                <asp:Parameter Name="Unit" Type="String" />
                <asp:Parameter Name="Rate" Type="Double" />
                <asp:Parameter Name="Amount" Type="Double" />
                <asp:Parameter Name="PartyAcId" Type="Int32" />
                <asp:Parameter Name="CreditAc" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="Gross" Type="Decimal" />
                <asp:Parameter Name="SalesTax" Type="Decimal" />
                <asp:Parameter Name="TotalQty" Type="Int32" />
                <asp:Parameter Name="Net" Type="Decimal" />
                <asp:Parameter Name="Ref" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
