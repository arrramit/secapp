<%@ page import="com.aramit.secapp.models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang.StringUtils" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="common/Head.jsp"></jsp:include>
</head>
<body>
    <jsp:include page="common/Navigation.jsp"></jsp:include>
    <div class='container' style='min-height: 450px'><div class='row'><div class='col-md-12'>

        <div class='row'>
            <div class='col-md-6'>
                <h2>Мониторинг заказа</h2>

                <s:actionerror theme="bootstrap"/>
                <s:actionmessage theme="bootstrap"/>
                <s:fielderror theme="bootstrap"/>

                <s:form action="userSearch" method="post" theme="bootstrap">
                    <s:textfield label="ID" name="login" placeholder="Введите ID заказа"/>
                    <s:submit cssClass="btn btn-primary"/>
                </s:form>
            </div>
            <div class='col-md-6'>
                <h2><s:property value="c"/>Search Result</h2>

                <s:if test="user">
                    <div class='alert alert-success'>
                        <strong>User found for query: </strong> <s:property value="login"/>
                    </div>
                    <table class='table'>
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                        <% List<User> users = (List<User>) session.getAttribute("users");
                            for ( User u : users) {
                                out.println(String.format("<tr>\n" +
                                        "<td>%s</td>\n" +
                                        "<td>%s</td>\n" +
                                        "<td>%s</td>\n" +
                                        "</tr>", u.getId(),u.getName(),u.getEmail()));
                            }
                        %>

                    </table>
                </s:if>
                <s:else>
                    <div class='alert alert-danger'>
                        <strong>User not found for query: </strong> <s:property value="login"/>
                    </div>
                </s:else>
            </div>
        </div>
    </div></div></div>
    <jsp:include page="common/Footer.jsp"></jsp:include>
</body>
</html>
