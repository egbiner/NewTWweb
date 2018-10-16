using NPOI.XWPF.UserModel;
using System;

using System.Data;
using System.IO;
using System.Web;

namespace TWweb
{
    public class WordHelper
    {
        public static string ExportApplyForm(string filepath,string path, DataTable t)
        {
            string[] tt = { "year", DateTime.Now.ToString("yyyy") };
            using (FileStream stream = File.OpenRead(filepath))
            {
                XWPFDocument doc = new XWPFDocument(stream);
                //foreach (var para in doc.Paragraphs)
                //{
                //    ReplaceKey(para, t);
                //}
                //遍历表格
                var tables = doc.Tables;
                foreach (var table in tables)
                {
                    foreach (var row in table.Rows)
                    {
                        foreach (var cell in row.GetTableCells())
                        {
                            foreach (var para in cell.Paragraphs)
                            {
                                ReplaceKey(para, t);
                            }
                        }
                    }
                }
                //string path = HttpContext.Current.Server.MapPath("../upload_files/template_file/" + DateTime.Now.Ticks + ".docx");
                FileStream out1 = new FileStream(path, FileMode.Create);
                doc.Write(out1);
                out1.Close();
                return path;
            }
        }

        public static void ReplaceKey(XWPFParagraph para, DataTable dt)
        {
            string[] arr = { "use_time_start", "use_time_end", "fz_user","fz_phone","ap_user",
                "ap_phone","ac_linkman","ac_linkman_phone","main_attend","activity",
                "participants_num","ap_reason",
                "device_need","ap_opinion","leader_opinion"};

            string text = para.ParagraphText;
            var runs = para.Runs;
            string styleid = para.Style;
            for (int i = 0; i < runs.Count; i++)
            {
                var run = runs[i];
                text = run.ToString();
                for (int j = 0; j < arr.Length; j++)
                {
                    //$$与模板中$$对应，也可以改成其它符号，比如{$name},务必做到唯一
                    if (text.Contains("$" + arr[j] + "$"))
                    {
                        switch (arr[j])
                        {
                            case "use_time_start":
                                 text = text.Replace("$" + arr[j] + "$", ((DateTime)dt.Rows[0]["use_time_start"]).ToString("yyyy 年 MM 月 dd 日  HH 点 mm 分"));
                                break;
                            case "use_time_end":
                                 text = text.Replace("$" + arr[j] + "$", ((DateTime)dt.Rows[0]["use_time_end"]).ToString("yyyy 年 MM 月 dd 日  HH 点 mm 分"));
                                break;
                            case "fz_user":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["fz_user"].ToString());
                                break;
                            case "fz_phone":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["fz_phone"].ToString());
                                break;
                            case "ap_user":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["ap_user"].ToString());
                                break;
                            case "ap_phone":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["ap_phone"].ToString());
                                break;
                            case "ac_linkman":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["ac_linkman"].ToString());
                                break;
                            case "ac_linkman_phone":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["ac_linkman_phone"].ToString());
                                break;
                            case "main_attend":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["main_attend"].ToString());
                                break;
                            case "activity":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["activity"].ToString());
                                break;
                            case "participants_num":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["participants_num"].ToString());
                                break;
                            case "ap_reason":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["ap_reason"].ToString());
                                break;
                            case "device_need":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["device_need"].ToString());
                                break;
                            case "ap_opinion":
                                text = text.Replace("$" + arr[j] + "$", dt.Rows[0]["ap_opinion"].ToString());
                                break;
                            case "leader_opinion":
                                {
                                    string opinion = "";
                                    if (Convert.ToInt32(dt.Rows[0]["status"]) == 0)
                                    {
                                        opinion = "未审核";
                                    }
                                    else if (Convert.ToInt32(dt.Rows[0]["status"]) == 1)
                                    {
                                        opinion = "审核通过";
                                    }
                                    else if (Convert.ToInt32(dt.Rows[0]["status"]) == 2)
                                    {
                                        opinion = "审核未通过";
                                    }
                                    else
                                    {
                                        opinion = "待审核";
                                    }
                                    text = text.Replace("$" + arr[j] + "$", opinion);
                                }; break;
                        }
                    }
                }
                runs[i].SetText(text, 0);
            }
        }

        public static void ReplaceKey(XWPFParagraph para, string[] model)
        {
            string text = para.ParagraphText;
            var runs = para.Runs;
            string styleid = para.Style;
            for (int i = 0; i < runs.Count; i++)
            {
                var run = runs[i];
                text = run.ToString();

                //$$与模板中$$对应，也可以改成其它符号，比如{$name},务必做到唯一
                if (text.Contains("$" + model[0] + "$"))
                {
                    text = text.Replace("$" + model[0] + "$", model[1]);
                }
                runs[i].SetText(text, 0);
            }
        }
    }
}