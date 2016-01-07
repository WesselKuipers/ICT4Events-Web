﻿using System;
using System.Linq;
using System.Web.UI;
using SharedModels.Models;

namespace ICT4Events_Web.Views.SocialMediaSystem.Controls
{
    using SharedModels.Logic;

    public partial class PostControl : UserControl
    {
        public Message Post { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            PreRender += OnPreRender;
        }

        private void OnPreRender(object sender, EventArgs eventArgs)
        {
            Username.InnerText = LogicCollection.UserLogic.GetById(Post.UserID).Username;

            like.Attributes.Add("value", Post.ID.ToString());
            report.Attributes.Add("value", Post.ID.ToString());

            var likes = LogicCollection.PostLogic.GetLikesByPost(Post);

            if (likes.Any())
            {
                like.InnerHtml += " " + likes.Count;
            }

            if(likes.Any(x => x == (SiteMaster.CurrentUser().ID)))
            {
                like.Attributes.Add("class", like.Attributes["class"] + " liked");
            }
        }
    }
}