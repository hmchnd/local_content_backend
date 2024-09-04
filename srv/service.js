const cds = require('@sap/cds');
const cloudSDK = require('@sap-cloud-sdk/core');
const axios = require('axios');

module.exports = (srv) => {
    srv.on('sendNotification', async (req) => {
        console.log('sendNotification action triggered.');

        const { to, subject, supplierID } = req.data;
        console.log('Received request with data:', { to, subject, supplierID });

        try {
            // Retrieve the destination configuration
            const emailDestination = await cloudSDK.getDestination('Email_notification_utility');
            console.log('Destination retrieved:', emailDestination);

            // Build the HTTP request configuration
            const emailRequestConfig = await cloudSDK.buildHttpRequest(emailDestination);
            console.log('Request configuration:', emailRequestConfig);

            emailRequestConfig.method = 'POST';
            emailRequestConfig.url = '/v2/odata/v4/catalog/sendmail'; 
            emailRequestConfig.data = {
                to: to,
                subject: subject,
                supplierID: "SUP001"
            };

            // Make the request to send the email
            const emailContentResponse = await axios.request(emailRequestConfig);
            

            if (emailContentResponse.status !== 200) {
                throw new Error('Failed to send email.');
            }

            return "Notification sent successfully.";
        } catch (error) {
            console.error(error);
            return `Error sending notification: ${error.message}`;
        }
    });
};
