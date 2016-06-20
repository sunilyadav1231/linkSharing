import java.text.SimpleDateFormat

/**
 * Created by ttnd on 18/6/16.
 */
class DateUtils {

    Date getUTDCurrentTime(){
        Date date =null;
        try {
            date = getTime("UTC",new Date())
        } catch (Exception e) {
            log.error "Error    : ${e.message}"
        }
    }

    Date getTime(String timeZone,Date date){
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd HH:mm:ss")
        dateFormat.setTimeZone(TimeZone.getTimeZone(timeZone))

        dateFormat.parse(dateFormat.format(timeZone))
    }
}
