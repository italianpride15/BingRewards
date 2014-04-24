#!/bin/sh
source "${LOCAL_CONFIG_DIR}/mailx.config.sh"
SUBJECT="Alert! BingRewards > ${2}%"
TEXT="In the last ${1} seconds rootfs passed the threshold of ${2} and reached ${3}%."
echo ${TEXT} | \
env MAILRC=/dev/null from="${SENDER}" smtp-auth-user="${SENDER}" smtp-auth-password="${SENDER_PASSWORD}" \
mailx -n \
    -S smtp-use-starttls \
    -S smtp-auth=login \
    -S smtp="$SMTP_SERVER" \
    -s "${SUBJECT}" "${RECEIVER}"