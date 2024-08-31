-- Keep a log of any SQL queries you execute as you solve the mystery.

SELECT description
FROM crime_scene_reports
WHERE year = 2023 AND month = 7 AND day = 28
  AND street = 'Humphrey Street';

+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                       description                                                                                                        |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery. |
| Littering took place at 16:36. No known witnesses.                                                                                                                                                                       |
+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+

fiftyville/ $ sqlite3 fiftyville.db
sqlite> SELECT transcript
   ...> FROM interviews
   ...> WHERE year = 2023 AND month = 7 AND day = 28;
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
|                                                                                                                                                     transcript                                                                                                                                                      |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| “Ah,” said he, “I forgot that I had not seen you for some weeks. It is a little souvenir from the King of Bohemia in return for my assistance in the case of the Irene Adler papers.”                                                                                                                               |
| “I suppose,” said Holmes, “that when Mr. Windibank came back from France he was very annoyed at your having gone to the ball.”                                                                                                                                                                                      |
| “You had my note?” he asked with a deep harsh voice and a strongly marked German accent. “I told you that I would call.” He looked from one to the other of us, as if uncertain which to address.                                                                                                                   |
| Sometime within ten minutes of the theft, I saw the thief get into a car in the bakery parking lot and drive away. If you have security footage from the bakery parking lot, you might want to look for cars that left the parking lot in that time frame.                                                          |
| I don't know the thief's name, but it was someone I recognized. Earlier this morning, before I arrived at Emma's bakery, I was walking by the ATM on Leggett Street and saw the thief there withdrawing some money.                                                                                                 |
| As the thief was leaving the bakery, they called someone who talked to them for less than a minute. In the call, I heard the thief say that they were planning to take the earliest flight out of Fiftyville tomorrow. The thief then asked the person on the other end of the phone to purchase the flight ticket. |
| Our neighboring courthouse has a very annoying rooster that crows loudly at 6am every day. My sons Robert and Patrick took the rooster to a city far, far away, so it may never bother us again. My sons have successfully arrived in Paris.                                                                        |
+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+



sqlite> SELECT *
   ...> FROM atm_transactions
   ...> WHERE year = 2023 AND month = 7 AND day = 28
   ...>   AND atm_location = 'Leggett Street'
   ...>   AND transaction_type = 'withdraw';
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| id  | account_number | year | month | day |  atm_location  | transaction_type | amount |
+-----+----------------+------+-------+-----+----------------+------------------+--------+
| 246 | 28500762       | 2023 | 7     | 28  | Leggett Street | withdraw         | 48     |
| 264 | 28296815       | 2023 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 266 | 76054385       | 2023 | 7     | 28  | Leggett Street | withdraw         | 60     |
| 267 | 49610011       | 2023 | 7     | 28  | Leggett Street | withdraw         | 50     |
| 269 | 16153065       | 2023 | 7     | 28  | Leggett Street | withdraw         | 80     |
| 288 | 25506511       | 2023 | 7     | 28  | Leggett Street | withdraw         | 20     |
| 313 | 81061156       | 2023 | 7     | 28  | Leggett Street | withdraw         | 30     |
| 336 | 26013199       | 2023 | 7     | 28  | Leggett Street | withdraw         | 35     |
+-----+----------------+------+-------+-----+----------------+------------------+--------+


sqlite> SELECT *
   ...> FROM bakery_security_logs
   ...> WHERE year = 2023 AND month = 7 AND day = 28;
+-----+------+-------+-----+------+--------+----------+---------------+
| id  | year | month | day | hour | minute | activity | license_plate |
+-----+------+-------+-----+------+--------+----------+---------------+
| 219 | 2023 | 7     | 28  | 8    | 2      | entrance | 1M92998       |
| 220 | 2023 | 7     | 28  | 8    | 2      | entrance | N507616       |
| 221 | 2023 | 7     | 28  | 8    | 2      | exit     | 1M92998       |
| 222 | 2023 | 7     | 28  | 8    | 2      | exit     | N507616       |
| 223 | 2023 | 7     | 28  | 8    | 7      | entrance | 7Z8B130       |
| 224 | 2023 | 7     | 28  | 8    | 7      | exit     | 7Z8B130       |
| 225 | 2023 | 7     | 28  | 8    | 13     | entrance | 47MEFVA       |
| 226 | 2023 | 7     | 28  | 8    | 13     | exit     | 47MEFVA       |
| 227 | 2023 | 7     | 28  | 8    | 15     | entrance | D965M59       |
| 228 | 2023 | 7     | 28  | 8    | 15     | entrance | HW0488P       |
| 229 | 2023 | 7     | 28  | 8    | 15     | exit     | D965M59       |
| 230 | 2023 | 7     | 28  | 8    | 15     | exit     | HW0488P       |
| 231 | 2023 | 7     | 28  | 8    | 18     | entrance | L93JTIZ       |
| 232 | 2023 | 7     | 28  | 8    | 23     | entrance | 94KL13X       |
| 233 | 2023 | 7     | 28  | 8    | 25     | entrance | L68E5I0       |
| 234 | 2023 | 7     | 28  | 8    | 25     | entrance | HOD8639       |
| 235 | 2023 | 7     | 28  | 8    | 25     | exit     | HOD8639       |
| 236 | 2023 | 7     | 28  | 8    | 34     | exit     | L68E5I0       |
| 237 | 2023 | 7     | 28  | 8    | 34     | entrance | 1106N58       |
| 238 | 2023 | 7     | 28  | 8    | 34     | entrance | W2CT78U       |
| 239 | 2023 | 7     | 28  | 8    | 34     | exit     | W2CT78U       |
| 240 | 2023 | 7     | 28  | 8    | 36     | entrance | 322W7JE       |
| 241 | 2023 | 7     | 28  | 8    | 38     | entrance | 3933NUH       |
| 242 | 2023 | 7     | 28  | 8    | 38     | exit     | 3933NUH       |
| 243 | 2023 | 7     | 28  | 8    | 42     | entrance | 0NTHK55       |
| 244 | 2023 | 7     | 28  | 8    | 44     | entrance | 1FBL6TH       |
| 245 | 2023 | 7     | 28  | 8    | 44     | exit     | 1FBL6TH       |
| 246 | 2023 | 7     | 28  | 8    | 49     | entrance | P14PE2Q       |
| 247 | 2023 | 7     | 28  | 8    | 49     | exit     | P14PE2Q       |
| 248 | 2023 | 7     | 28  | 8    | 50     | entrance | 4V16VO0       |
| 249 | 2023 | 7     | 28  | 8    | 50     | exit     | 4V16VO0       |
| 250 | 2023 | 7     | 28  | 8    | 57     | entrance | 8LLB02B       |
| 251 | 2023 | 7     | 28  | 8    | 57     | exit     | 8LLB02B       |
| 252 | 2023 | 7     | 28  | 8    | 59     | entrance | O784M2U       |
| 253 | 2023 | 7     | 28  | 8    | 59     | exit     | O784M2U       |
| 254 | 2023 | 7     | 28  | 9    | 14     | entrance | 4328GD8       |
| 255 | 2023 | 7     | 28  | 9    | 15     | entrance | 5P2BI95       |
| 256 | 2023 | 7     | 28  | 9    | 20     | entrance | 6P58WS2       |
| 257 | 2023 | 7     | 28  | 9    | 28     | entrance | G412CB7       |
| 258 | 2023 | 7     | 28  | 10   | 8      | entrance | R3G7486       |
| 259 | 2023 | 7     | 28  | 10   | 14     | entrance | 13FNH73       |
| 260 | 2023 | 7     | 28  | 10   | 16     | exit     | 5P2BI95       |
| 261 | 2023 | 7     | 28  | 10   | 18     | exit     | 94KL13X       |
| 262 | 2023 | 7     | 28  | 10   | 18     | exit     | 6P58WS2       |
| 263 | 2023 | 7     | 28  | 10   | 19     | exit     | 4328GD8       |
| 264 | 2023 | 7     | 28  | 10   | 20     | exit     | G412CB7       |
| 265 | 2023 | 7     | 28  | 10   | 21     | exit     | L93JTIZ       |
| 266 | 2023 | 7     | 28  | 10   | 23     | exit     | 322W7JE       |
| 267 | 2023 | 7     | 28  | 10   | 23     | exit     | 0NTHK55       |
| 268 | 2023 | 7     | 28  | 10   | 35     | exit     | 1106N58       |
| 269 | 2023 | 7     | 28  | 10   | 42     | entrance | NRYN856       |
| 270 | 2023 | 7     | 28  | 10   | 44     | entrance | WD5M8I6       |
| 271 | 2023 | 7     | 28  | 10   | 55     | entrance | V47T75I       |
| 272 | 2023 | 7     | 28  | 11   | 6      | entrance | 4963D92       |
| 273 | 2023 | 7     | 28  | 11   | 13     | entrance | C194752       |
| 274 | 2023 | 7     | 28  | 11   | 52     | entrance | 94MV71O       |
| 275 | 2023 | 7     | 28  | 12   | 20     | entrance | FLFN3W0       |
| 276 | 2023 | 7     | 28  | 12   | 49     | entrance | 207W38T       |
| 277 | 2023 | 7     | 28  | 13   | 8      | entrance | RS7I6A0       |
| 278 | 2023 | 7     | 28  | 13   | 30     | entrance | 4468KVT       |
| 279 | 2023 | 7     | 28  | 13   | 42     | entrance | NAW9653       |
| 280 | 2023 | 7     | 28  | 14   | 18     | exit     | NAW9653       |
| 281 | 2023 | 7     | 28  | 15   | 6      | exit     | RS7I6A0       |
| 282 | 2023 | 7     | 28  | 15   | 16     | exit     | 94MV71O       |
| 283 | 2023 | 7     | 28  | 16   | 6      | exit     | WD5M8I6       |
| 284 | 2023 | 7     | 28  | 16   | 38     | exit     | 4468KVT       |
| 285 | 2023 | 7     | 28  | 16   | 42     | exit     | 207W38T       |
| 286 | 2023 | 7     | 28  | 16   | 47     | exit     | C194752       |
| 287 | 2023 | 7     | 28  | 17   | 11     | exit     | NRYN856       |
| 288 | 2023 | 7     | 28  | 17   | 15     | exit     | 13FNH73       |
| 289 | 2023 | 7     | 28  | 17   | 16     | exit     | V47T75I       |
| 290 | 2023 | 7     | 28  | 17   | 18     | exit     | R3G7486       |
| 291 | 2023 | 7     | 28  | 17   | 36     | exit     | FLFN3W0       |
| 292 | 2023 | 7     | 28  | 17   | 47     | exit     | 4963D92       |
+-----+------+-------+-----+------+--------+----------+---------------+


sqlite> SELECT *
   ...> FROM phone_calls
   ...> WHERE year = 2023 AND month = 7 AND day = 28
   ...>   AND duration < 60;
+-----+----------------+----------------+------+-------+-----+----------+
| id  |     caller     |    receiver    | year | month | day | duration |
+-----+----------------+----------------+------+-------+-----+----------+
| 221 | (130) 555-0289 | (996) 555-8899 | 2023 | 7     | 28  | 51       |
| 224 | (499) 555-9472 | (892) 555-8872 | 2023 | 7     | 28  | 36       |
| 233 | (367) 555-5533 | (375) 555-8161 | 2023 | 7     | 28  | 45       |
| 251 | (499) 555-9472 | (717) 555-1342 | 2023 | 7     | 28  | 50       |
| 254 | (286) 555-6063 | (676) 555-6554 | 2023 | 7     | 28  | 43       |
| 255 | (770) 555-1861 | (725) 555-3243 | 2023 | 7     | 28  | 49       |
| 261 | (031) 555-6622 | (910) 555-3251 | 2023 | 7     | 28  | 38       |
| 279 | (826) 555-1652 | (066) 555-9701 | 2023 | 7     | 28  | 55       |
| 281 | (338) 555-6650 | (704) 555-2131 | 2023 | 7     | 28  | 54       |
+-----+----------------+----------------+------+-------+-----+----------+

sqlite> ^CSELECT *
   ...> FROM flights
   ...> JOIN airports ON flights.origin_airport_id = airports.id
   ...> WHERE airports.city = 'Fiftyville'
   ...>   AND year = 2023 AND month = 7 AND day = 29
   ...> ORDER BY hour, minute;
+----+-------------------+------------------------+------+-------+-----+------+--------+----+--------------+-----------------------------+------------+
| id | origin_airport_id | destination_airport_id | year | month | day | hour | minute | id | abbreviation |          full_name          |    city    |
+----+-------------------+------------------------+------+-------+-----+------+--------+----+--------------+-----------------------------+------------+
| 36 | 8                 | 4                      | 2023 | 7     | 29  | 8    | 20     | 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
| 43 | 8                 | 1                      | 2023 | 7     | 29  | 9    | 30     | 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
| 23 | 8                 | 11                     | 2023 | 7     | 29  | 12   | 15     | 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
| 53 | 8                 | 9                      | 2023 | 7     | 29  | 15   | 20     | 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
| 18 | 8                 | 6                      | 2023 | 7     | 29  | 16   | 0      | 8  | CSF          | Fiftyville Regional Airport | Fiftyville |
+----+-------------------+------------------------+------+-------+-----+------+--------+----+--------------+-----------------------------+------------+
