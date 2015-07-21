<%-- Challenge Site component. The component with the challenge site layout--%>
<%@include file="/libs/foundation/global.jsp"%>
<%@page session="false" %>

<!doctype html>
<html lang="en" data-framework="jquery">
	<head>
		<meta charset="utf-8">
        <title>Challenge Site</title>

        <cq:include script="/libs/wcm/core/components/init/init.jsp"/>
		<cq:includeClientLib categories="challenge_ad.todo_site_libs" />

	</head>
	<body>
        <cq:include path="header" resourceType="challenge_ad/components/challenge_header" />
		<cq:include path="body" resourceType="challenge_ad/components/challenge_body" />
        <cq:include path="footer" resourceType="challenge_ad/components/challenge_footer" />
	</body>
</html>
