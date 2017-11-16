﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Industrial_Project.webfroms
{
    public partial class DifferentNavigation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //    /// <summary>
        //    /// Logs out the user and deletes the session.
        //    /// </summary>
        //    /// <param name="sender"></param>
        //    /// <param name="e"></param>
        protected void LogOut_click(object sender, EventArgs e)
        {
            Session["username"] = null;
            Response.Redirect("newLogin.aspx");
        }
    }
}