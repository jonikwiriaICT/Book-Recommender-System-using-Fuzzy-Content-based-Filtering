<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMaster.master" AutoEventWireup="true" CodeFile="CustomerSignIn.aspx.cs" Inherits="CustomerSignIn" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
 <section class ="content">
        <section class=" container ">
        <div class="row">
            <div class="col-md-12">
                <div id="formView" runat="server">
                    <div class="panel">
                        <div class="panel-heading ">
                            <div class="panel-title ">
                                <h4>Sign in</h4>

                            </div>
                        </div>
                        <div class="panel-body">
                            <div class="box box-primary">
                                <div class="box-body box-profile">
                                    <br />
                                    <asp:Panel ID="PnlCurrency" runat="server">
                                        <asp:HiddenField ID="rec_id" runat="server" />
                                        <asp:HiddenField ID="currency_description" runat="server" />
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label style="font-size: 12px">User Name</label>
                                            </div>
                                            <div class="col-md-9">
                                                <asp:TextBox ID="username" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label style="font-size: 12px">User Password</label>
                                            </div>
                                            <div class="col-md-9">                                              
                                                <asp:TextBox ID="userpassword" TextMode="Password" CssClass="form-control" runat="server" autocomplete="off"></asp:TextBox>                                              
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-12">
                                                <asp:LinkButton ID="lnkSaveChanges" OnClick="loginClick" CssClass="btn btn-sm btn-primary pull-right  " runat="server"><i class="fa fa-save "></i>&nbsp Save Changes</asp:LinkButton>
                                            </div>
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
 </section>
</asp:Content>



