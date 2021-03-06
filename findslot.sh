#!/usr/bin/env bash

slots_output=""

json_output=`curl -X GET "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict?district_id=365&date=07-05-2021" -H "accept: application/json" -H "Accept-Language: en_US"`

slots_output=`echo $json_output | jq '.centers[] | {sessions: .sessions[]} | .sessions | select(.["min_age_limit"] == 45) | select(.["available_capacity"] > 0)'`

echo $slots_output

if [ "${slots_output}" == "" ] ; then
  echo "No slots available"
else
  while true
  do
    echo -ne '\007'
  done
fi
