<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="PointOfSaleWebApp.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/bootstrap.css" rel="stylesheet" />
    <link href="CSS/Global.css" rel="stylesheet" />
    <title>Dashboard</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="banner">
                <img src="Images/POS-Banner.jpg" alt="" class="banner-img">
            </div>
        </div>

        <main>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-3">
                        <div class="card">
                            <img src="Images/chart-of-account.jpeg" class="card-img-top" alt="...">
                            <div class="card-img-overlay">
                                <div class="card-title">
                                    Chart of Accounts
                                </div>
                                <div class="card-footer">
                                    <asp:Button runat="server" CssClass="btn" Text="CLICK HERE" OnClick="Unnamed1_Click" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div class="card">
                            <img src="Images/items.png" class="card-img-top" alt="...">
                            <div class="card-img-overlay">
                                <div class="card-title">
                                    Items Coding
                                </div>
                                <div class="card-footer">
                                    <asp:Button runat="server" CssClass="btn" Text="CLICK HERE" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div class="card">
                            <img src="Images/sales.jpg" class="card-img-top" alt="...">
                            <div class="card-img-overlay">
                                <div class="card-title">
                                    Sales Invoice
                                </div>
                                <div class="card-footer">
                                    <asp:Button runat="server" CssClass="btn" Text="CLICK HERE" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-3">
                        <div class="card">
                            <img src="Images/report.jpg" class="card-img-top" alt="...">
                            <div class="card-img-overlay">
                                <div class="card-title">
                                    Reports
                                </div>
                                <div class="card-footer">
                                    <asp:Button runat="server" CssClass="btn" Text="CLICK HERE" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
