﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using Oracle.DataAccess.Client;
using SharedModels.Data.ContextInterfaces;
using SharedModels.Models;

namespace SharedModels.Data.OracleContexts
{
    public class LocationOracleContext : EntityOracleContext<Place>, ILocationContext
    {
        public List<Place> GetAll()
        {
            var query = "SELECT * FROM location ORDER BY locationid";
            var res = Database.ExecuteReader(query);

            return res.Select(GetEntityFromRecord).ToList();
        }

        public Place GetById(object id)
        {
            var query = "SELECT * FROM location WHERE locationid = :locationid";
            var parameters = new List<OracleParameter>
            {
                new OracleParameter("locationid", Convert.ToInt32(id))
            };

            return GetEntityFromRecord(Database.ExecuteReader(query, parameters).First());
        }

        public Place Insert(Place entity)
        {
            var query =
                "INSERT INTO location (locationid, eventid, name, capacity, price, x, y) VALUES (seq_location.nextval, :eventid, :name, :capacity, :price, :x, :y) RETURNING locationid INTO :lastID";
            var parameters = new List<OracleParameter>
            {
                /*
                new OracleParameter("eventid", entity.EventID),
                new OracleParameter("name", entity.Name),
                new OracleParameter("capacity", entity.Capacity),
                new OracleParameter("price", entity.Price),
                new OracleParameter("x", entity.Coordinates.X),
                new OracleParameter("y", entity.Coordinates.Y),
                new OracleParameter("lastID", OracleDbType.Decimal) {Direction = ParameterDirection.ReturnValue}
                */
            };

            string newID;
            if (!Database.ExecuteNonQuery(query, out newID, parameters)) return null;
            return GetById(Convert.ToInt32(newID));
        }

        public bool Update(Place entity)
        {
            const string query = "UPDATE location SET name = :name, capacity = :capacity, price = :price, x = :x, y = :y WHERE locationid = :locationid";

            var parameters = new List<OracleParameter>
            {
                new OracleParameter("locationid", entity.ID),
                new OracleParameter("name", entity.Name),
                new OracleParameter("capacity", entity.Capacity),
                new OracleParameter("price", entity.Price),
                new OracleParameter("x", entity.Coordinates.X),
                new OracleParameter("y", entity.Coordinates.Y),
            };

            return Database.ExecuteNonQuery(query, parameters);
        }

        public bool Delete(Place entity)
        {
            var query = "DELETE FROM location WHERE locationid = :locationid";
            var parameters = new List<OracleParameter> { new OracleParameter("locationid", entity.ID) };

            return Database.ExecuteNonQuery(query, parameters);
        }

        public List<Place> GetAllByEvent(Event ev)
        {
            var query = "SELECT * FROM location WHERE eventid = :eventid ORDER BY locationid";
            var parameters = new List<OracleParameter> { new OracleParameter("eventid", ev.ID) };
            var res = Database.ExecuteReader(query, parameters);

            return res.Select(GetEntityFromRecord).ToList();
        }

        protected override Place GetEntityFromRecord(List<string> record)
        {
            if (record == null) return null;

            // ID locatie_id nummer capaciteit comfortplek handicap afmeting kraan x y prijs
            // 0  1          2      3          4           5        6        7     8 9 10

            return new Place(Convert.ToInt32(record[0]), Convert.ToInt32(record[1]), record[2],
                Convert.ToInt32(record[3]), Convert.ToDecimal(record[10]),
                new Point(Convert.ToInt32(record[5]), Convert.ToInt32(record[6])), Convert.ToBoolean(record[7]),
                Convert.ToBoolean(record[8]), Convert.ToBoolean(record[9]), Convert.ToInt32(record[10]));
        }
    }
}