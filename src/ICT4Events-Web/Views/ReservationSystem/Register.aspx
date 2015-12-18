﻿<%@ Page Title="Registreren" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" EnableEventValidation="true" Inherits="ICT4Events_Web.Webform" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %></h2>
        <fieldset>
            <div class="col-md-6">
            
            <!-- voornaam leader -->
            <div class="form-group">
              <asp:Label runat="server" CssClass="control-label" AssociatedControlID="leader_first_name">Voornaam:</asp:Label>  
              <asp:TextBox runat="server" ID="leader_first_name" CssClass="form-control input-md" placeholder="ex: Stefano"/>
              <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="leader_first_name" Display="Dynamic" ErrorMessage="Voornaam is verplicht" ValidationGroup="RegistrationGroup" />
            </div>

            <!-- achternaam leader -->
            <div class="form-group">
              <asp:Label runat="server" CssClass="control-label" AssociatedControlID="leader_last_name">Achternaam:</asp:Label>  
              <asp:TextBox runat="server" ID="leader_last_name" CssClass="form-control input-md" placeholder="ex: Bovenkamp" />
              <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="leader_last_name" Display="Dynamic" ErrorMessage="Achternaam is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
                
            <!-- adres leader-->
            <div class="form-group">              
              <asp:Label runat="server" CssClass="control-label" AssociatedControlID="leader_address">Adres:</asp:Label>
              <asp:TextBox runat="server" ID="leader_address" CssClass="form-control input-md" placeholder="ex: Kennedylaan" />
              <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="leader_address" Display="Dynamic" ErrorMessage="Adres is verplicht" ValidationGroup="RegistrationGroup"/>
            </div>

            <!-- woonplaats leader -->
            <div class="form-group">           
              <asp:Label runat="server" CssClass="control-label" AssociatedControlID="leader_city">Woonplaats:</asp:Label>
              <asp:TextBox runat="server" ID="leader_city" CssClass="form-control input-md" placeholder="ex: Eindhoven" />
              <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="leader_city" Display="Dynamic" ErrorMessage="Woonplaats is verplicht" ValidationGroup="RegistrationGroup"/>
            </div>

            </div>
            <div class="col-md-6">

            <!-- iban leader -->
            <div class="form-group">
              <asp:Label runat="server" CssClass="control-label" AssociatedControlID="leader_iban">Rekeningnummer:</asp:Label>  
              <asp:TextBox runat="server" ID="leader_iban" CssClass="form-control input-md" placeholder="ex: NL99 BANK 2183 2384 12" />
              <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="leader_iban" Display="Dynamic" ErrorMessage="IBAN is verplicht" ValidationGroup="RegistrationGroup" />
              <asp:CustomValidator ID="test" runat="server" ControlToValidate="leader_iban" ClientValidationFunction="validateIban" CssClass="text-danger" Display="Dynamic" ErrorMessage="IBAN is niet geldig" ValidateEmptyText="False" ValidationGroup="RegistrationGroup"/>  
            </div>
                
             <!-- Emailadres leader -->
            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="leader_Email">Emailadres:</asp:Label>  
                <asp:TextBox runat="server" ID="leader_Email" CssClass="form-control input-md" placeholder="ex: johndoe@gmail.com" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="leader_Email" Display="Dynamic" ErrorMessage="Emailadres is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
                
           <div class="form-group">
                <asp:Label runat="server" CssClass="control-label"  AssociatedControlID="leader_Password" >Wachtwoord</asp:Label>
                <asp:TextBox runat="server" ID="leader_Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="leader_Password" CssClass="text-danger" ErrorMessage="Password is required." Display="Dynamic" />
            </div>
            
            </div>
        </fieldset>
    <hr/>
    <div class="col-md-6">
            <h3>Reserveerders aangeven:</h3>
            <!-- Emailadres 1 -->
            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="Email1">Emailadres reserveerder 1:</asp:Label>  
                <asp:TextBox runat="server" ID="Email1" CssClass="form-control input-md" placeholder="ex: johndoe@gmail.com" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Email1" Display="Dynamic" ErrorMessage="Emailadres is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
    
                <!-- Emailadres 2 -->
            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="Email2">Emailadres reserveerder 2:</asp:Label>  
                <asp:TextBox runat="server" ID="Email2" CssClass="form-control input-md" placeholder="ex: johndoe@gmail.com" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Email2" Display="Dynamic" ErrorMessage="Emailadres is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
    
                <!-- Emailadres 3 -->
            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="Email3">Emailadres reserveerder 3:</asp:Label>  
                <asp:TextBox runat="server" ID="Email3" CssClass="form-control input-md" placeholder="ex: johndoe@gmail.com" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Email3" Display="Dynamic" ErrorMessage="Emailadres is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
    
                <!-- Emailadres 4 -->
            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="Email4">Emailadres reserveerder 4:</asp:Label>  
                <asp:TextBox runat="server" ID="Email4" CssClass="form-control input-md" placeholder="ex: johndoe@gmail.com" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Email4" Display="Dynamic" ErrorMessage="Emailadres is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
    
                <!-- Emailadres 5 -->
            <div class="form-group">
                <asp:Label runat="server" CssClass="control-label" AssociatedControlID="Email5">Emailadres reserveerder 5:</asp:Label>  
                <asp:TextBox runat="server" ID="Email5" CssClass="form-control input-md" placeholder="ex: johndoe@gmail.com" />
                <asp:RequiredFieldValidator runat="server" CssClass="text-danger" ControlToValidate="Email5" Display="Dynamic" ErrorMessage="Emailadres is verplicht" ValidationGroup="RegistrationGroup" />
            </div>
        </div>
    <div class="col-md-6">
        <h3>Locatie kiezen:</h3>
    </div>
    
    <div class="clearfix"></div>
    <hr />
    <div class="form-group">
        <asp:Button ID="btnSubmit" runat="server" Text="Registereren" CssClass="btn btn-primary" OnClick="btnSubmit_Click" CausesValidation="true" ValidationGroup="RegistrationGroup" />
    </div>

    <div id="feedbackPanel" class="alert alert-info alert-dismissible" role="alert" runat="server" Visible="False">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
        <strong>Status registratie:</strong>
        <br/>
        <asp:Label ID="Label1" runat="server" Visible="False" Text="Label"></asp:Label>
    </div>

<script src="../../Scripts/iban.js"></script>
<script>
    function validateInput() {
        var firstname = $("#MainContent_first_name").val().length > 0;
        var lastname = $("#MainContent_first_name").val().length > 0;
        var ibanValid = validateIban();

        return firstname && lastname && ibanValid;
    }

    function validateIban(sender, args) {
        var valid = IBAN.isValid($("#MainContent_iban").val());
        args.IsValid = valid;
        return valid;
    }
</script>


</asp:Content>

