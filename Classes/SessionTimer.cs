using ControlStudy;
using System;
using System.Linq;
using Timer = System.Timers.Timer;

namespace ControlStudy
{
    class SessionTimer //Таймер сессии
    {
        public DateTime startTime;
        public DateTime endTime;
        readonly Timer timer = new Timer();

        public SessionTimer() //Включение таймера
        {
            timer.Interval = 1000;
            timer.Start();
            startTime = DateTime.Now;
        }

        public void SaveTimeSession(string login) // Сохранение таймера
        {
            endTime = DateTime.Now;
            TimeSpan timeSpan = endTime - startTime;
            DateTime Date = DateTime.Now;

            int idPerson = ControlStudyEntities.GetContext().People.Where(c => c.LoginUser == login).Select(c => c.IdPerson).FirstOrDefault();
            var findIdPerson = ControlStudyEntities.GetContext().Sessions.Where(c => c.IdPerson == idPerson).FirstOrDefault();


            if(findIdPerson == null)
            {
                Session sessionUser = new Session
                {
                    DateSession = Date,
                    IdPerson = idPerson,
                    Time = Convert.ToString(timeSpan.Hours + ":" + timeSpan.Minutes + ":" + timeSpan.Seconds)
                };

                ControlStudyEntities.GetContext().Sessions.Add(sessionUser);
            }
            else
            {
                findIdPerson.Time = Convert.ToString(timeSpan.Hours + ":" + timeSpan.Minutes + ":" + timeSpan.Seconds);
                findIdPerson.DateSession = Date;
            }

            ControlStudyEntities.GetContext().SaveChanges();
            timer.Stop();
        }
    }
}
