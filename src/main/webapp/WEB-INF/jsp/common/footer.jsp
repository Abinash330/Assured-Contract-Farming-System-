<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<c:choose>
    <c:when test="${sessionScope.role == 'farmer'}">
        <jsp:include page="/WEB-INF/jsp/common/footer_farmer.jsp" />
    </c:when>
    <c:when test="${sessionScope.role == 'buyer'}">
        <jsp:include page="/WEB-INF/jsp/common/footer_buyer.jsp" />
    </c:when>
    <c:when test="${sessionScope.role == 'inspector'}">
        <jsp:include page="/WEB-INF/jsp/common/footer_inspector.jsp" />
    </c:when>
    <c:when test="${sessionScope.role == 'admin'}">
        <jsp:include page="/WEB-INF/jsp/common/footer_admin.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="/WEB-INF/jsp/common/footer_public.jsp" />
    </c:otherwise>
</c:choose>
