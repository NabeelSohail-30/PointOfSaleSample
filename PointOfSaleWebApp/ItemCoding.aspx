<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ItemCoding.aspx.cs" Inherits="PointOfSaleWebApp.ItemCoding" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/Global.css" rel="stylesheet" />
    <title>Item of Coding</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="banner">
                <img src="Images/items.png" alt="" class="banner-img">
            </div>
        </div>
        
        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="col d-flex justify-content-center">
                        <asp:Label ID="lblContentHeading" runat="server" Text="Item Coding" CssClass="lbl_ContentHeading"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:Panel ID="panelAdd" runat="server" CssClass="panel">
                            <div class="container mt-3">
                                <div class="row">
                                    <div class="col-2">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Item Code</label>
                                            <asp:TextBox ID="Code" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-4">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Description</label>
                                            <asp:TextBox ID="Desc" runat="server" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Category</label>
                                            <asp:DropDownList ID="Catg" runat="server" CssClass="form-control" DataSourceID="SqlDataSource2" DataTextField="Category" DataValueField="CaegoryId"></asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-3">
                                        <div class="form-group">
                                            <label for="" class="input-heading">Unit</label>
                                            <asp:TextBox ID="Unit" runat="server" CssClass="form-control"></asp:TextBox>
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
                                            <asp:Button ID="btnCancel" runat="server" CssClass="btn mr-2" Text="Cancel" OnClick="btnCancel_Click" ></asp:Button>
                                            <asp:Button ID="btnUpdate" runat="server" CssClass="btn ml-2 mr-2" Text="Update" OnClick="btnUpdate_Click" ></asp:Button>
                                            <asp:Button ID="btnDelete" runat="server" CssClass="btn ml-2" Text="Delete" OnClick="btnDelete_Click" ></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>

                <div class="row">
                    <div class="col">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="grid" DataKeyNames="ItemCode" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand">
                            <Columns>
                                <asp:TemplateField HeaderText="Item Code" SortExpression="ItemCode">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("ItemCode") %>' CommandArgument='<%# Eval("ItemCode") %>'></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                <asp:BoundField DataField="Category" HeaderText="Category" SortExpression="Category" />
                                <asp:BoundField DataField="Unit" HeaderText="Unit" SortExpression="Unit" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </main>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" SelectCommand="SELECT * FROM [view_ItemsDetails]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PointOfSaleConnectionString %>" SelectCommand="SELECT * FROM [ItemCategory]"></asp:SqlDataSource>

    </form>
</body>
</html>
