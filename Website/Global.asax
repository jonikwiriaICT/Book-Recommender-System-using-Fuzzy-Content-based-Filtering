<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Routing" %>

<script RunAt="server">
    static void RegisterRoutes(RouteCollection routes)
    {
        //first param is unique, second param is the expected url, thrid param is the actual file/page
        //general root menu
        //Administration Users
        routes.MapPageRoute("rtencf", "en", "~/Error.aspx");
        routes.MapPageRoute("rten", "error", "~/Default.aspx");
        routes.MapPageRoute("rtIndex", "Index", "~/Default.aspx");
        routes.MapPageRoute("rtHome", "Home", "~/Default.aspx");
        routes.MapPageRoute("rtDashboard", "Dashboard", "~/Dashboard.aspx");
        routes.MapPageRoute("rtSCM", "Admin-Login", "~/AdminLogin.aspx");
        routes.MapPageRoute("rtChangePassword", "Change-Password", "~/ChangePassword.aspx");
        routes.MapPageRoute("rtCategory", "Category", "~/Category.aspx");
        routes.MapPageRoute("rtProduct", "Product", "~/Product.aspx");
        routes.MapPageRoute("rtProductColor", "Product-Color", "~/ProductColor.aspx");
        routes.MapPageRoute("rtProductImage", "Product-Image", "~/ProductImage.aspx");
        routes.MapPageRoute("rtProductSize", "Product-Size", "~/ProductSize.aspx");
        routes.MapPageRoute("rtStore", "Store", "~/Store.aspx");
        routes.MapPageRoute("rtUserRole", "User-Role", "~/UserRole.aspx");
        routes.MapPageRoute("rtAdminUserRegistration", "Admin-User-Registration", "~/AdminUsers.aspx");
        routes.MapPageRoute("rtAuditTrail", "Audit-Trail", "~/AuditTrail.aspx");
        routes.MapPageRoute("rtStockReport", "Stock-Report", "~/StockReport.aspx");

        //Customer User
        routes.MapPageRoute("rtCustomerRegistration", "Customer-Registration", "~/CustomerRegister.aspx");
        routes.MapPageRoute("rtCustomerSignin", "Customer-Signin", "~/CustomerSignIn.aspx");
        routes.MapPageRoute("rtCustomerDashboard", "Customer-Dashboard", "~/CustomerDashboard.aspx");
        routes.MapPageRoute("rtCustomerReport", "Customer-Report", "~/CustomerReport.aspx");
        routes.MapPageRoute("rtCustomerChangePassword", "Customer-Change-Password", "~/CustomerChangePassword.aspx");
        routes.MapPageRoute("rtCart", "Cart", "~/Cart.aspx");
        routes.MapPageRoute("rtProductDetails", "Product-Details", "~/ProductDetails.aspx");
        routes.MapPageRoute("rtEmptyCart", "Empty-Cart", "~/EmptyCart.aspx");
        routes.MapPageRoute("rtCheckOut", "Check-Out", "~/CheckOut.aspx");
          routes.MapPageRoute("rtCheck", "Check", "~/Check.aspx");
        routes.MapPageRoute("rtPaymentFailure", "Payment-Failure", "~/PaymentFailure.aspx");
        routes.MapPageRoute("rtPaymenatFailure", "Payment-Success", "~/PaymentSuccess.aspx");


    }
    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        RegisterRoutes(RouteTable.Routes);
        // SqlServerTypes.Utilities.LoadNativeAssemblies(Server.MapPath("~/bin"));
    }
</script>
