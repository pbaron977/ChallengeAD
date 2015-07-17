<%--

  Main Component component.

  The main component for the Backend Challenge

--%>

<%@include file="/libs/foundation/global.jsp"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Backup Challenge</title>
  </head>
  <cq:include script="head.jsp"/>
  <cq:include path="parsys" resourceType="foundation/components/parsys"/>
  <body>
    <cq:include path="headerChallenge" resourceType="challenge/components/ChallengeHeaderComponent"/>
    <cq:include path="bodyChallenge" resourceType="challenge/components/ChallengeBodyComponent"/>
    <cq:include path="footerChallenge" resourceType="challenge/components/ChallengeFooterComponent"/>
  </body>
</html>