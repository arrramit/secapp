<%@ page import="org.apache.struts2.ServletActionContext" %>
<%@ page import="com.aramit.secapp.models.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<% response.addHeader("X-XSS-Protection", "0");response.addCookie(new Cookie("session_id","2af26905dcf31a1dfb1bf857106323fe")); %>
<head>
    <jsp:include page="common/Head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common/Navigation.jsp"></jsp:include>
    <div class='container' style='min-height: 450px'><div class='row'><div class='col-md-12'>

        <h2>
            <i class='fa fa-list'></i> Available Products
            <span class='pull-right'>
                <a href='#' class='btn btn-primary' data-toggle="modal" data-target="#searchModal">Search Product</a>
                <a href='<s:url action="addEditProduct"/>' class='btn btn-primary'>Add Product</a>
            </span>
        </h2>

        <s:if test="searchQuery != null">
            <p class="bg-success">
                Listing products with <strong>search query: </strong> <%= request.getParameter("searchQuery") %>
                <small><a href="<s:url action="listProduct"/>">
                    <i class="fa fa-remove"></i> Clear
                </a></small>
            </p>
        </s:if>

        <table class='table'>
            <tr>
                <th>#</th>
                <th width='50%'>Name</th>
                <th>Code</th>
                <th></th>
            </tr>
            <% List<Product> products = (List<Product>) session.getAttribute("products");
                for ( Product p : products) {
                    out.println(String.format("<tr>\n" +
                            "<td>%s</td>\n" +
                            "<td>%s</td>\n" +
                            "<td>%s</td>\n" +
                            "</tr>", p.getId(),p.getName(),p.getCode()));
                }
            %>
        </table>

        <div class="modal fade" tabindex="-1" role="dialog" id="searchModal">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Search Product</h4>
                    </div>
                    <div class="modal-body">
                        <s:form action="listProduct" method="post" theme="bootstrap">
                            <s:textfield
                                    label="Query"
                                    name="searchQuery"
                                    placeholder="Search by name"/>
                            <s:submit cssClass="btn btn-primary"/>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>

        </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
