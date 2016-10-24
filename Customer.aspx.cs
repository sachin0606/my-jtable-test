using myapp_webform;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JTableAspNetWebFormsDemos
{
    public partial class Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

            }
        }


        #region Customer

        [WebMethod(EnableSession = true)]
        public static object CustomerList(int jtStartIndex, int jtPageSize, string jtSorting)
        {
            try
            {

                //get count
                int studentCount = GetCustomer_count();


                //Get data from database
                using (var db = new cableappEntities())
                {
                    var Questions = (from Question in db.tbl_customer
                                     select Question)
                           .OrderBy(Question => Question.id)
                           .Skip(jtStartIndex)
                           .Take(jtPageSize).ToList();


                    if (Questions.Count != 0)
                        return new { Result = "OK", Records = Questions, TotalRecordCount = studentCount };
                    else return 0;
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR Reading Database", Message = ex.Message };
            }

        }


        public static int GetCustomer_count()
        {
            try
            {
                using (var db = new cableappEntities())
                {
                    return db.tbl_customer.Count();

                }
            }
            catch(Exception ex)
            {
                return 0;
            }

        }



        [WebMethod(EnableSession = true)]
        public static object CreateNewCustomer(cls_customer record)
        {
            try
            {



                using (var db = new cableappEntities())
                {
                    var newTblMember = new tbl_customer
                    {
                        cust_id = record.cust_id,
                        First_Name = record.First_Name,
                        MiddleName = record.MiddleName,
                        LastName = record.LastName,
                        Address = record.Address,
                        stbno = record.stbno,
                        vcno = record.vcno,
                        BalanceAmt = record.BalanceAmt,
                        MobileNo = record.MobileNo,
                        remarks = record.remarks,
                        Area_id = record.Area_id,
                        connectionDate = record.connectionDate,
                        isactive = record.isactive
                    };
                    var NewEmpAdd = db.tbl_customer.Add(newTblMember);
                    db.SaveChanges();
                    return new { Result = "OK", Record = NewEmpAdd };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }


        [WebMethod(EnableSession = true)]
        public static object DeleteCustomer(int id)
        {
            try
            {
                using (cableappEntities db = new cableappEntities())
                {
                    var deletedmember = db.tbl_customer.First(e => e.id == id);
                    db.tbl_customer.Remove(deletedmember);
                    db.SaveChanges();
                    return new { Result = "OK" };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }





        [WebMethod(EnableSession = true)]
        public static object UpdateCustomer(cls_customer record)
        {
            try
            {
                int memid = record.id;
                using (cableappEntities db = new cableappEntities())
                {
                    var updateuser = (from member in db.tbl_customer
                                      where (member.id == memid)
                                      select member).FirstOrDefault();
                    updateuser.cust_id = record.cust_id;
                    updateuser.First_Name = record.First_Name;
                    updateuser.MiddleName = record.MiddleName;
                    updateuser.LastName = record.LastName;
                    updateuser.Address = record.Address;
                    updateuser.stbno = record.stbno;
                    updateuser.vcno = record.vcno;
                    updateuser.BalanceAmt = record.BalanceAmt;
                    updateuser.MobileNo = record.MobileNo;
                    updateuser.remarks = record.remarks;
                    updateuser.Area_id = record.Area_id;
                    updateuser.connectionDate = record.connectionDate;
                    updateuser.isactive = record.isactive;
                    db.tbl_customer.Attach(updateuser);
                    var entry = db.Entry(updateuser);
                    entry.Property(e => e.First_Name).IsModified = true;
                    entry.Property(e => e.MiddleName).IsModified = true;
                    entry.Property(e => e.LastName).IsModified = true;
                    entry.Property(e => e.Address).IsModified = true;
                    entry.Property(e => e.vcno).IsModified = true;
                    entry.Property(e => e.stbno).IsModified = true;
                    entry.Property(e => e.MobileNo).IsModified = true;
                    entry.Property(e => e.isactive).IsModified = true;
                    entry.Property(e => e.connectionDate).IsModified = true;
                    entry.Property(e => e.BalanceAmt).IsModified = true;
                    entry.Property(e => e.Area_id).IsModified = true;


                    db.SaveChanges();
                    return new { Result = "OK", };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }


        #endregion


        #region Area

        [WebMethod(EnableSession = true)]
        public static object AreaList(int jtStartIndex, int jtPageSize, string jtSorting)
        {
            try
            {
                //get count
                int studentCount = GetAreaCount();

                //Get data from database
                using (var db = new cableappEntities())
                {
                    var Questions = (from Question in db.tbl_area
                                     select Question)
                           .OrderBy(Question => Question.Area_id)
                           .Skip(jtStartIndex)
                           .Take(jtPageSize).ToList();


                    if (Questions.Count != 0)
                        return new { Result = "OK", Records = Questions, TotalRecordCount = studentCount };
                    else return 0;
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR Reading Database", Message = ex.Message };
            }

        }


        public static int GetAreaCount()
        {
            using (var db = new cableappEntities())
            {
                return db.tbl_area.Count();

            }

        }



        [WebMethod(EnableSession = true)]
        public static object CreateNewArea(cls_Area record)
        {
            try
            {



                using (var db = new cableappEntities())
                {
                    var newTblMember = new tbl_area
                    {
                        Area_id = record.Area_id,
                        AreaName = record.AreaName,
                        Description = record.Description,

                    };
                    var NewEmpAdd = db.tbl_area.Add(newTblMember);
                    db.SaveChanges();
                    return new { Result = "OK", Record = NewEmpAdd };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }


        [WebMethod(EnableSession = true)]
        public static object DeleteArea(int Area_id)
        {
            try
            {
                using (cableappEntities db = new cableappEntities())
                {
                    var deletedmember = db.tbl_area.First(e => e.Area_id == Area_id);
                    db.tbl_area.Remove(deletedmember);
                    db.SaveChanges();
                    return new { Result = "OK" };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }





        [WebMethod(EnableSession = true)]
        public static object UpdateArea(cls_Area record)
        {
            try
            {
                int memid = record.Area_id;
                using (cableappEntities db = new cableappEntities())
                {
                    var updateuser = (from member in db.tbl_area
                                      where (member.Area_id == memid)
                                      select member).FirstOrDefault();
                    updateuser.AreaName = record.AreaName;
                    updateuser.Description = record.Description;

                    db.tbl_area.Attach(updateuser);
                    var entry = db.Entry(updateuser);
                    entry.Property(e => e.AreaName).IsModified = true;
                    entry.Property(e => e.Description).IsModified = true;
                    db.SaveChanges();
                    return new { Result = "OK", };
                }
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }


        #endregion

        [WebMethod]
        public static object GetArea_list()
        {
            try
            {
                cableappEntities db = new cableappEntities();

                var cities = (from customer in db.tbl_area
                              select customer).Select(c => new { DisplayText = c.AreaName, Value = c.Area_id });
                return new { Result = "OK", Options = cities };
            }
            catch (Exception ex)
            {
                return new { Result = "ERROR", Message = ex.Message };
            }
        }

       
    }
}