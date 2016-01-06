﻿namespace SharedModels.Models
{
    public class ReservationAccount
    {
       public int ID { get; set; }
       public int ReservationId { get; set; }
       public int UserId { get; set; }
       public int PlaceId { get; set; }
       public bool Present { get; set; }

        public ReservationAccount(int id, int reservationId, int userId, int placeid, bool present = false)
        {
            ID = id;
            ReservationId = reservationId;
            UserId = userId;
            PlaceId = placeid;
            Present = present;
        }
    }
}
