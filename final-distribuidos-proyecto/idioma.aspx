﻿<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/maestra-empresa.Master" CodeBehind="idioma.aspx.vb" Inherits="final_distribuidos_proyecto.idioma" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <form runat="server">
        <div class="container mt-4">
            <h2 class="text-center mb-4">Gestión de Idiomas</h2>
            <asp:Button ID="btnAgregar" runat="server" Text="Agregar Nuevo Idioma" CssClass="btn btn-primary mt-3" OnClick="btnAgregar_Click" />

            <div class="row">
                <div class="col-md-8">
                    <asp:GridView ID="gvIdiomas" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-hover"
                        DataKeyNames="id_idioma" OnRowEditing="gvIdiomas_RowEditing" OnRowUpdating="gvIdiomas_RowUpdating"
                        OnRowCancelingEdit="gvIdiomas_RowCancelingEdit" OnRowCommand="gvIdiomas_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" ItemStyle-Width="50px">
                                <ItemTemplate>
                                    <%# Eval("id_idioma") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <%# Eval("id_idioma") %>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Nombre Idioma" ItemStyle-Width="500px">
                                <ItemTemplate>
                                    <span style="font-size: 14px;"><%# Eval("nombre_idioma") %></span>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtNombreIdioma" runat="server" Text='<%# Bind("nombre_idioma") %>' CssClass="form-control" Style="width: 100%; font-size: 14px; padding: 5px;" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Vigencia" ItemStyle-Width="80px">
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkVigencia" runat="server" Checked='<%# Convert.ToBoolean(Eval("vigencia")) %>' Enabled="False" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chkEditVigencia" runat="server" Checked='<%# Bind("vigencia") %>' CssClass="form-check-input" Style="width: 20px; height: 20px;" />
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Acciones" ItemStyle-Width="800px">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm" Style="width: 70px;">
                                        <i class="bi bi-pencil-square"></i> Editar
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Eliminar" CommandArgument='<%# Eval("id_idioma") %>' CssClass="btn btn-danger btn-sm" Style="width: 70px;"
                                        OnClientClick="return confirmDelete();">
                                        <i class="bi bi-trash"></i> Eliminar
                                    </asp:LinkButton>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnUpdate" runat="server" CommandName="Update" CssClass="btn btn-success btn-sm" Style="width: 70px;">
                                        <i class="bi bi-check-lg"></i> Guardar
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="btnCancel" runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm" Style="width: 70px;">
                                        <i class="bi bi-x-lg"></i> Cancelar
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="col-md-4">
                    <asp:Panel ID="panelEditar" runat="server" Visible="False" CssClass="card p-3 shadow-sm">
                        <h3 class="card-title">
                            <asp:Label ID="lblTitulo" runat="server" Text="Agregar/Editar Idioma"></asp:Label>
                        </h3>

                        <div class="form-group">
                            <asp:Label ID="lblNombreIdioma" runat="server" Text="Nombre Idioma:" CssClass="form-label" />
                            <asp:TextBox ID="txtNombreIdiomaPanel" runat="server" CssClass="form-control" />
                        </div>

                        <div class="form-group">
                            <asp:Label ID="lblVigencia" runat="server" Text="Vigencia:" CssClass="form-label" />
                            <asp:CheckBox ID="chkVigenciaPanel" runat="server" CssClass="form-check-input" />
                        </div>

                        <div class="d-flex justify-content-between">
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-success" OnClick="btnGuardar_Click" />
                            <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>

    <script type="text/javascript">
        function confirmDelete() {
            return swal({
                title: "¿Estás seguro?",
                text: "Esta acción eliminará el idioma de forma permanente.",
                icon: "warning",
                buttons: ["Cancelar", "Eliminar"],
                dangerMode: true,
            }).then((willDelete) => {
                return willDelete;
            });
        }
    </script>

</asp:Content>
