<!-- <Snippet1> -->
<%@ Page language="VB" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    
<script runat="server">        
    
  ' <Snippet2>
  Sub SortButton_Click(ByVal sender As Object, ByVal e As EventArgs) 
      
    ' Create the sort expression from the values selected 
    ' by the user from the DropDownList controls. Multiple
    ' columns can be sorted by creating a sort expression
    ' that contains a comma-separated list of field names.
    Dim expression As String = SortList1.SelectedValue & " " & _
      DirectionList1.SelectedValue & " ," & SortList2.SelectedValue
    
    ' Determine the sort direction of the second column.
    ' The sort direction parameter applies only to the 
    ' last column sorted.
    Dim direction2 As SortDirection = SortDirection.Ascending
    If DirectionList2.SelectedValue = "DESC" Then
        direction2 = SortDirection.Descending
    End If
    
    ' Use the Sort method to programmatically sort the ListView
    ' control using the sort expression and direction.
    ContactsListView.Sort(expression, direction2)

  End Sub
  ' </Snippet2>
  
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
  <head id="Head1" runat="server"> 
    <title>ListView Sort Example</title>
    <style type="text/css">
      body {  font: 10pt Trebuchet MS; }
    </style>
  </head>
  <body>
    <form id="form1" runat="server">
          
      <h3>ListView Sort Example</h3>

      <table>
        <tr>
          <td>Sort by:</td>
          <td>
            <asp:DropDownList ID="SortList1" runat="server">
              <asp:ListItem>ContactID</asp:ListItem>
              <asp:ListItem Selected="true">FirstName</asp:ListItem>
              <asp:ListItem>LastName</asp:ListItem>
              <asp:ListItem>EmailAddress</asp:ListItem>              
            </asp:DropDownList>
          </td>
          <td>Sort order:</td>
          <td>
            <asp:DropDownList ID="DirectionList1" runat="server">
              <asp:ListItem Value="ASC" Text="Ascending" Selected="True" />
              <asp:ListItem Value="DESC" Text="Descending" />
            </asp:DropDownList>
          </td>
        </tr>
        <tr>
          <td>Then by:</td>
          <td>
            <asp:DropDownList ID="SortList2" runat="server">
              <asp:ListItem>ContactID</asp:ListItem>
              <asp:ListItem>FirstName</asp:ListItem>
              <asp:ListItem Selected="true">LastName</asp:ListItem>
              <asp:ListItem>EmailAddress</asp:ListItem>
            </asp:DropDownList>
          </td>
          <td>Sort order:</td>
          <td>
            <asp:DropDownList ID="DirectionList2" runat="server">
              <asp:ListItem Value="ASC" Text="Ascending" Selected="True" />
              <asp:ListItem Value="DESC" Text="Descending" />
            </asp:DropDownList>
          </td>
        </tr>
      </table>

      <asp:Button id="SortButton"
        Text="Sort"
        OnClick="SortButton_Click" 
        runat="server"/>  

      <br/><br />

      <asp:ListView ID="ContactsListView" 
        DataSourceID="ContactsDataSource" 
        runat="server">
        <LayoutTemplate>
          <table cellpadding="2" width="640px" border="1" runat="server" id="tblContacts">
            <tr runat="server">
              <th runat="server">ContactID</th>
              <th runat="server">FirstName</th>
              <th runat="server">LastName</th>
              <th runat="server">EmailAddress</th>
            </tr>
            <tr runat="server" id="itemPlaceholder" />
          </table>
          <asp:DataPager runat="server" ID="ContactsDataPager" PageSize="12">
            <Fields>
              <asp:NextPreviousPagerField ButtonType="Button"
                ShowFirstPageButton="true" 
                ShowLastPageButton="true" />
            </Fields>
          </asp:DataPager>
        </LayoutTemplate>
        <ItemTemplate>
          <tr runat="server">
            <td>
              <asp:Label ID="ContactIDLabel" runat="server" Text='<%#Eval("ContactID") %>' />
            </td>
            <td>
              <asp:Label ID="FirstNameLabel" runat="server" Text='<%#Eval("FirstName") %>' />
            </td>
            <td>
              <asp:Label ID="LastNameLabel" runat="server" Text='<%#Eval("LastName") %>' />
            </td>
            <td>
              <asp:Label ID="EmailAddressLabel" runat="server" Text='<%#Eval("EmailAddress") %>' />
            </td>
          </tr>
        </ItemTemplate>
      </asp:ListView>              
        
      <!-- This example uses Microsoft SQL Server and connects      -->
      <!-- to the AdventureWorks sample database. Use an ASP.NET    -->
      <!-- expression to retrieve the connection string value       -->
      <!-- from the Web.config file.                                -->      
      <asp:SqlDataSource ID="ContactsDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:AdventureWorks_DataConnectionString %>"
        SelectCommand="SELECT [ContactID], [FirstName], [LastName], [EmailAddress] 
          FROM Person.Contact">
      </asp:SqlDataSource>
        
    </form>
  </body>
</html>
<!-- </Snippet1> -->