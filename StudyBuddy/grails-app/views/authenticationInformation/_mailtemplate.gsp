<div>
    <h1> Email Confirmation</h1>
    <p>Hello ${username}, Thank-you for joining StudyBuddy!</p>
    <p>Your password is: ${password}</p>
    <g:link absolute="true" controller="authenticationInformation" action="confirm" id="${code}">Click this link to confirm your account</g:link>

</div>