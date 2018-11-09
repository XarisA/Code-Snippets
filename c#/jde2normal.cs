class SurroundingClass
{
    public SurroundingClass()
    {
        InitializeComponent();
        int julianDate = 111158;
        DateTime normalDate = ConvertJulianToDateTime(julianDate);
        string customDate = String.Format("{0:MM/dd/yy}", normalDate);
        MessageBox.Show(String.Format("Julian date: {0} converted to normal: {1}.", julianDate, customDate));
    }

    private DateTime ConvertJulianToDateTime(int JulianDate)
    {
        string strDate = JulianDate.ToString();
        DateTime date;
        string C = strDate.Substring(0, 1);
        string YY = strDate.Substring(1, 2);
        string DDD = strDate.Substring(3, 3);

        int intC = Convert.ToInt32(C);
        int intYY = Convert.ToInt32(YY);
        int intDDD = Convert.ToInt32(DDD);
        date = new DateTime((1900 + (intC * 100) + intYY), 1, 1).AddDays(intDDD);
        return date;
    }
}