﻿using System.Collections.Generic;
using SharedModels.Models;

namespace SharedModels.Data.ContextInterfaces
{
    public interface IEventContext : IRepositoryContext<Event>
    {
        List<string> GetTagsByEvent(Event ev);
    }
}
