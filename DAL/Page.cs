using DAL;
using System.Collections.Generic;

namespace MyClass
{
    public class Page
    {
        public List<News> pages;
        public List<ApplyForm> applypages;
        public int total_count;
        public int total_page;
        public int page_size;
        public int page_num;
        public int number_start;
        public int number_end;

        public Page(List<News> page_lst, int total_count, int page_size, int page_num)
        {
            this.pages = page_lst;
            this.total_count = total_count;
            this.total_page = total_count / page_size + 1;
            this.page_size = page_size;
            this.page_num = page_num;
            this.number_start = page_size * (page_num - 1) + 1;
            this.number_end = this.number_start + page_size - 1;
            if (this.pages.Count < page_size)
            {
                this.number_end = this.number_start + this.pages.Count - 1;
            }
        }

        public Page(List<ApplyForm> page_lst, int total_count, int page_size, int page_num)
        {
            this.applypages = page_lst;
            this.total_count = total_count;
            this.total_page = total_count / page_size + 1;
            this.page_size = page_size;
            this.page_num = page_num;
            this.number_start = page_size * (page_num - 1) + 1;
            this.number_end = this.number_start + page_size - 1;
            if (this.applypages.Count < page_size)
            {
                this.number_end = this.number_start + this.applypages.Count - 1;
            }
        }
    }
}
