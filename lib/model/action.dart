class NotificationAction {
  String title;
  String content;
  String date;

  NotificationAction({this.title, this.content, this.date});

  List getActions() {
    return [
      NotificationAction(
          title: "İzin Onay",
          content: "Onayınızı bekleyen toplam 2 adet izin talebi bulunmaktadır",
          date: "12.10.2020"),
      NotificationAction(
          title: "AVANS ONAY",
          content:
              "Onayınızı bekleyen toplam 3 adet avans talebi bulunmaktadır.",
          date: "12.05.2019"),
      NotificationAction(
          title: "Rapor Onay",
          content: "Onayınızı bekleyen 5 adet rapor bulunmaktadır.",
          date: "12.09.2020"),
      NotificationAction(
          title: "Satın Alma Onay",
          content: "Onayınızı bekleyen 1 adet satın alma talebi bulunmaktadır.",
          date: "04.10.2020"),
    ];
  }
}

