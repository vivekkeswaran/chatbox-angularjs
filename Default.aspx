<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <meta charset="UTF-8">
    <title>SharePoint</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <meta name="viewport" content="width=device-width" />

    <link href='http://fonts.googleapis.com/css?family=Raleway:400,600,500,300,700' rel='stylesheet' type='text/css' />
    <script type="text/javascript"
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js"></script>
    <script type="text/javascript" src="Helper.js"></script>

    <link rel="stylesheet" type="text/css" href="css/style.css" media="all" />

    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/jquery.inputfocus-0.9.min.js"></script>
    <script type="text/javascript" src="js/jquery.main.js"></script>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.backstretch.min.js"></script>
    <script type="text/javascript" src="js/templatemo_script.js"></script>

    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/templatemo_main.css" />
    <style type="text/css">
        #txtName {
            height: 30px;
            font-size: 13px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="main-wrapper">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 affix text-center" style="z-index: 1;">
                    <h1 class="templatemo-site-title">
                        <img src="images/btn-menu.png" alt="main menu" id="m-btn" class="pull-right visible-xs visible-sm" />
                    </h1>

                    <ul id="responsive" style="display: none" class="hidden-lg hidden-md"></ul>
                </div>

                <div class="image-section">
                    <div class="image-container">
                        <img src="images/nature5.jpg" id="home-img" class="main-img inactive" alt="Home" />
                        <img src="images/nature2.jpg" id="about-img" class="inactive" alt="About" />
                        <img src="images/nature3.jpg" id="services-img" class="inactive" alt="Services" />
                        <img src="images/nature4.jpg" id="testimonial-img" class="inactive" alt="Testimonial" />
                        <img src="images/nature5.jpg" id="contact-img" class="inactive" alt="Contact" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-6 col-md-offset-6 templatemo-content-wrapper loginSection">
                        <div class="templatemo-content">

                            <section id="home-text" class="active templatemo-content-section">
                                <form action="mychat.aspx">
                                <div class="col-sm-12 col-md-12 col-lg-12">
                                    <div id="login_Screen">
                                        <h2 class="homePage-loginText">Welcome to <span>SharePoint</span></h2>
                                        <input id="txtName" size="30" placeholder="Name" />&nbsp;
                                        <input type="submit" id="btnAddUser" class="btn btn-primary" value="Login" onclick="AddUser();" />
                                    </div>
                                </div></form>
                            </section>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 footer">
                        <p class="footer-text">Copyright &copy; 2017 SharePoint @ Vivek</p>
                    </div>
                </div>

            </div>
            <div id="preloader">
                <div id="status">&nbsp;</div>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        var btnAddUser = $("#btnAddUser");
        var txtName = $("#txtName");

        function AddUser() {

            var chatService = new ServiceCall("AddUser",
             "{'userName':'" + txtName.val() + "'}");
            chatService.callService(addUser_Complete);
        }

        function addUser_Complete() {
            window.open("mychat.aspx", "_self");
        }
    </script>
</body>
</html>
