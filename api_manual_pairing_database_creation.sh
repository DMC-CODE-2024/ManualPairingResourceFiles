source ~/.bash_profile

source $commonConfigurationFilePath
dbDecryptPassword=$(java -jar  ${APP_HOME}/encryption_utility/PasswordDecryptor-0.1.jar spring.datasource.password)

mysql  -h$dbIp -P$dbPort -u$dbUsername -p${dbDecryptPassword} $appdbName <<EOFMYSQL

INSERT ignore INTO app.sys_param (tag, value) VALUES ('default_language', 'en');

INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_allowed_device_type', 'Mobile,Laptop','auto_pairing_identify');
INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_allowed_days', '10','auto_pairing_identify');

INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_allowed_count', '5','auto_pairing_identify');

INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_msisdn_min_length', '7','auto_pairing_identify');
INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_msisdn_max_length', '10','auto_pairing_identify');
INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_otp_max_valid_retries', '4','auto_pairing_identify');
INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_notification_sms_start_time', '09:00','auto_pairing_identify');
INSERT ignore INTO app.sys_param (tag, value,feature_name) VALUES ('pairing_notification_sms_end_time', '18:00','auto_pairing_identify'); 

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairOtpSMS', NULL, '<OTP> is your OTP for manual pairing request. Never share your OTP with anyone', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairOtpEmail', NULL, 'Hi,\n<OTP> is your OTP for manual pairing request. Never share your OTP with anyone', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairSMS', NULL, 'Your pairing request for reference number <REFERENCE_ID> is paired successfully. The pairing details are as follow\n<Pair>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairEmail', NULL, 'Hi,\nYour pairing request for reference number <REFERENCE_ID> is paired successfully. The pairing details are as follow\n<Pair>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairRepairSMS', NULL, 'Your repair request with reference number <REFERENCE_ID> is repaired successfully. The new pair detail is\n<PAIR>.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairRepairEmail', NULL, 'Hi,\nYour repair request with reference number <REFERENCE_ID> is repaired successfully. The new pair detail is\n<PAIR>.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_FAIL_DEVICE_MODELS_ARE_NOT_SAME', NULL, 'All the provided IMEI do not belong to same device. Kindly check your IMEI.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_FAIL_DEVICE_TYPES_ARE_NOT_ALLOWED', NULL, 'There is no need to pair this device. This IMEI will work and does not require pairing.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_OTP_CUSTOM_CHECKED_NO_PAIR_REQUIRED', NULL, 'This IMEI is part of  tax paid device. This IMEI will work and does not require pairing.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_ALREADY_PAIRED', NULL, 'Pair already exists between the IMEI and MSISDN', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_INVALID_IMSI_NOT_FOUND', NULL, 'MSISDN is found to be invalid. Hence this IMEI cannot be paired', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_DUPLICATE_IMEI_FAIL', NULL, 'IMEI is found to be duplicate. Hence this IMEI cannot be paired', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_BLACKLIST_IMEI_FAIL', NULL, 'IMEI is found to be stolen or lost. Hence this IMEI cannot be paired', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_GREYLIST_IMEI_FAIL', NULL, 'IMEI is found to be stolen or lost. Hence this IMEI cannot be paired', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_PAIR_COUNT_LIMIT_FAIL', NULL, 'Pair limit for this IMEI has been exhausted. Hence this IMEI cannot be paired further.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_EXCEPTION_LIST_NO_PAIR_REQUIRED', NULL, 'This IMEI belong to special category. This IMEI will work and does not require pairing', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_INVALID_IMEI_FAIL', NULL, 'IMEI is found to be invalid. Hence this IMEI cannot be paired', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_FAIL_GSMA_INVALID', NULL, 'IMEI is found to be GSMA non-compliant. Hence this IMEI cannot be paired', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_OTP_VALIDATION_SUCCESS', NULL, 'OTP validation completed successfully', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairRepairFailedSMS', NULL, 'Your repair request  for reference number <REFERENCE_ID> has failed.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairRepairFailedEmail', NULL, 'Hi,\nYour repair request  for reference number <REFERENCE_ID> has failed.', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairFailedEmail', NULL, 'Hi,\nYour pairing request for reference number <REFERENCE_ID> is not paired. The pairing details are\n<Pair>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairFailedSMS', NULL, 'Your pairing request for reference number <REFERENCE_ID> is not paired. The pairing details are\n<Pair>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_REQUEST_ACCEPTED', NULL, 'Your request has been accepted. The OTP has been sent to your Contact Number / Email ID for reference number <REFERENCE_ID>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_RESEND_OTP', NULL, 'OTP has been resent for reference number <REFERENCE_ID> on your Contact Number / Email ID', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_EXCEPTION_LIST_VIP_NO_PAIR_REQUIRED', NULL, 'No Need to pair as Found in Exception list as VIP', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_EXCEPTION_LIST_NON_VIP_NO_PAIR_REQUIRED', NULL, 'No Need to pair as Found in Exception list as NON VIP', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairRepairSubject', NULL, 'Repaired Notification <REFERENCE_ID>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairSubject', NULL, 'Paired Notification <REFERENCE_ID>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'ManualPairOtpSubject', NULL, 'OTP for Reference Number <REFERENCE_ID>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_REQUEST_ALREADY_PROCESSED', NULL, 'Request Number <REFERENCE_ID> already processed. Not resending Otp', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_OTP_VALIDATION_FAIL_MAX_RETRY', NULL, 'Otp validation limit Exhausted for Request No:<REFERENCE_ID>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_PAIR_NOT_FOUND_FAIL', NULL, 'Pairs Not found', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_OTP_VALIDATION_FAIL', NULL, 'Otp Invalid for Request No:<REFERENCE_ID>, left attempt:<OTP_COUNT_LEFT>', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_OLD_PAIR_NOT_FOUND_FAIL', NULL, 'Invalid Request, Pair not exist', 1, 'MANUAL', NULL, NULL, NULL, 'en');

INSERT INTO eirs_response_param (description, tag, type, value, active, feature_name, remarks, user_type, modified_by, language)
VALUES (NULL, 'HTTP_RESP_REPAIR_SUCCESS', NULL, 'The device is successfully Repaired', 1, 'MANUAL', NULL, NULL, NULL, 'en');





EOFMYSQL
