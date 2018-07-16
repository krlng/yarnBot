export start=$(date --date '-1 min' +"%s%N" | cut -b1-13)
export end=$(date +"%s%N" | cut -b1-13)
echo $start
echo $end
export jobLog=$(curl -s http://df-m:8088/ws/v1/cluster/apps | jq --arg start "$start"  --arg ende "$end" '.apps[][] | select(.finishedTime<($ende  | tonumber)) | select(.finishedTime>($start | tonumber)) | {"datetime": $start, "id":.id, "queue":.queue, "finalStatus":.finalStatus, "name":.name }')
echo $jobLog >> /yarnErrors.log
export text="$(echo $jobLog | jq -r '.id'): $(echo $jobLog | jq -r '.finalStatus'), $(echo $jobLog | jq -r '.queue'), $(echo $jobLog | jq -r '.name')"
echo $text
if [[ -n "$jobLog" ]]; then
    /notify.sh "$text"
fi
