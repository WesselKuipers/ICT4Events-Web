﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SharedModels.Data.ContextInterfaces;
using SharedModels.Data.OracleContexts;
using SharedModels.Models;

namespace SharedModels.Logic
{
    public class PostLogic
    {
        private readonly IMessageContext _context;

        public PostLogic()
        {
            _context = new PostOracleContext();
        }

        public PostLogic(IMessageContext context)
        {
            _context = context;
        }

        public List<Message> GetAllMainPosts() => _context.GetAll();
        public List<Message> GetRepliesByPost(Message message) => _context.GetRepliesByPost(message);

        public List<Message> SearchPostsByHashtag(string hashtag) => _context.SearchMessages(hashtag);

        public List<int> GetLikesByPost(Message message) => _context.GetLikesByMessage(message);
        public List<int> GetReportsByPost(Message message) => _context.GetReportsByMessage(message);

        public bool LikePost(User user, int postId)
        {
            var post = _context.GetById(postId);
            return post != null && _context.LikeMessage(user, post);
        }
    }
}