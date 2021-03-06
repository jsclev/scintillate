import Foundation
import SQLite3

class WorkDAO: BaseDAO {
    init(conn: OpaquePointer?) {
        super.init(conn: conn, table: "work", loggerName: String(describing: type(of: self)))
    }

//    func get(id: Int) throws -> WorkViewModel {
//        var stmt: OpaquePointer?
//        try getRowById(stmt: &stmt, table: table, idName: "id", id: id)
//
//        if let firstName = try getString(stmt: stmt, colIndex: 5),
//           let lastName = try getString(stmt: stmt, colIndex: 7) {
//            let person = Person(
//                    personId: getInt(stmt: stmt, colIndex: 0),
//                    updatedAt: try getDate(stmt: stmt, colIndex: 2),
//                    syncedAt: try getDate(stmt: stmt, colIndex: 3),
//                    firstName: firstName,
//                    middleName: try getString(stmt: stmt, colIndex: 6),
//                    lastName: lastName,
//                    title: try getString(stmt: stmt, colIndex: 22))
//
//            sqlite3_finalize(stmt)
//
//            return person
//        }
//
//        throw DbError.Db(message: "Could not find work by id.")
//    }

//    func insert(account: AccountDTO, people: [PersonDTO]) throws {
//        if people.count == 0 {
//            logger.debug("Zero people to insert into the person table.")
//            return
//        }
//
//        var sql = """
//                  INSERT INTO person (
//                      person_id,
//                      account_id,
//                      updated_at,
//                      synced_at,
//                      party_id,
//                      first_name,
//                      middle_name,
//                      last_name,
//                      title,
//                      gender_id
//                  ) VALUES
//                  """
//
//        for person in people {
//            var genderId: Int? = nil
//            if let gender = person.gender {
//                genderId = gender.genderId
//            }
//
//            sql += "("
//            sql += getSql(val: person.personId, postfix: ", ")
//            sql += getSql(val: account.accountId, postfix: ", ")
//            sql += getSql(val: Date(), postfix: ", ")
//            sql += getSql(val: Date(), postfix: ", ")
//            sql += getSql(val: person.party.partyId, postfix: ", ")
//            sql += getSql(val: person.firstName, postfix: ", ")
//            sql += getSql(val: person.middleName, postfix: ", ")
//            sql += getSql(val: person.lastName, postfix: ", ")
//            sql += getSql(val: person.title, postfix: ", ")
//            sql += getSql(val: genderId, postfix: "")
//            sql += "), "
//        }
//
//        sql = getCleanedSql(sql)
//
//        do {
//            try executeInsert(table: table, numRows: people.count, sql: sql)
//        }
//        catch SQLiteError.Prepare(let message) {
//            var errMsg = "Failed to compile the SQL to insert rows into the person table.  "
//            errMsg += "SQLite error message: " + message
//            throw DbError.Db(message: errMsg)
//        }
//        catch SQLiteError.Step(let message) {
//            var errMsg = "Failed to execute the SQL to insert rows into the person table.  "
//            errMsg += "SQLite error message: " + message
//            throw DbError.Db(message: errMsg)
//        }
//    }

//    func updatePerson(account: Account, person: PersonDTO) throws {
//        var sql = "UPDATE person SET "
//
//        sql += getUpdateSql(column: "updated_at", val: Date(), postfix: ", ")
//        sql += getUpdateSql(column: "synced_at", val: Date(), postfix: ", ")
//        sql += getUpdateSql(column: "first_name", val: person.firstName, postfix: ", ")
//        sql += getUpdateSql(column: "middle_name", val: person.middleName, postfix: ", ")
//        sql += getUpdateSql(column: "last_name", val: person.lastName, postfix: ", ")
//        sql += getUpdateSql(column: "title", val: person.title, postfix: ", ")
//        sql += getUpdateSql(column: "gender_id", val: person.gender?.genderId, postfix: " ")
//        sql += "WHERE person_id = \(person.personId) AND account_id = \(account.accountId);"
//
//        do {
//            try executeNonQuery(sql: sql)
//        }
//        catch SQLiteError.Prepare(let message) {
//            var errMsg = "Failed to compile the SQL to update person.  "
//            errMsg += "SQLite error message: " + message
//            throw DbError.Db(message: errMsg)
//        }
//        catch SQLiteError.Step(let message) {
//            var errMsg = "Failed to update a row in the person table.  "
//            errMsg += "SQLite error message: " + message
//            throw DbError.Db(message: errMsg)
//        }
//    }

//    func getAll() -> [Work] {
//        var works = [Work]()
//
//        let sql = """
//            select
//                w.id as work_id,
//                w.title,
//                a.id as author_id,
//                a.first_name,
//                a.middle_name,
//                a.last_name
//            from
//                work w
//            left outer join
//                work_author wa on wa.work_id = w.id
//            left outer join
//                author a on a.id = wa.author_id
//            order by
//                w.sort_by_title, w.id, a.last_name, a.first_name;
//        """
//
//        var stmt: OpaquePointer?
//
//        do {
//            if sqlite3_prepare_v2(conn, sql, -1, &stmt, nil) == SQLITE_OK {
//                var prevWorkId = -1;
//                var currWorkId = -1;
//                var authors = [Author]()
//                var work = Work(id: -1, title: "", authors: authors, awards: [])
//
//                while sqlite3_step(stmt) == SQLITE_ROW {
//                    let currWorkId = getInt(stmt: stmt, colIndex: 0)
//                    let authorId = getInt(stmt: stmt, colIndex: 2)
//                    let firstName = try getString(stmt: stmt, colIndex: 3)
//                    let middleName = try getString(stmt: stmt, colIndex: 4)
//                    let lastName = try getString(stmt: stmt, colIndex: 5)
//
//                    if currWorkId != prevWorkId {
//                        if let firstName = firstName, let lastName = lastName {
//                            authors.append(Author(id: authorId,
//                                                  firstName: firstName,
//                                                  middleName: middleName,
//                                                  lastName: lastName))
//                        }
//
//                        if let title = try getString(stmt: stmt, colIndex: 1) {
//                            works.append(Work(id: currWorkId,
//                                              title: title,
//                                              authors: authors,
//                                              awards: []))
//                            authors = [Author]()
//                        }
//                    }
//                    else {
//                        if let firstName = firstName, let lastName = lastName {
//                            authors.append(Author(id: authorId,
//                                                  firstName: firstName,
//                                                  middleName: middleName,
//                                                  lastName: lastName))
//                        }
//                    }
//
//                    prevWorkId = currWorkId
//                }
//            }
//        } catch {
//            print(error)
//        }
//
//        return works
//    }
    
    func getHugoWinnersOnly() -> [Work] {
        var works = [Work]()
        
        let sql = """
            SELECT
                w.id AS work_id,
                w.title AS work_title,
                w.image_name,
                aw.name AS award_name,
                ac.year AS award_year,
                ac.name AS award_category,
                CASE WHEN wac.status = 1 THEN 'Winner'
                     WHEN wac.status = 2 THEN 'Finalist'
                END AS award_status,
                a.id AS author_id,
                a.first_name AS author_first_name,
                a.middle_name AS author_middle_name,
                a.last_name AS author_last_name,
                s.id AS series_id,
                s.name AS series_name,
                ws.ordinal_name AS series_ordinal_name
            FROM
                work w
            INNER JOIN
                work_award_category wac ON wac.work_id = w.id
            INNER JOIN
                award_category ac ON ac.id = wac.award_category_id
            INNER JOIN
                award aw ON aw.id = ac.award_id
            LEFT OUTER JOIN
                work_author wa ON wa.work_id = w.id
            LEFT OUTER JOIN
                author a ON a.id = wa.author_id
            LEFT OUTER JOIN
                work_series ws ON ws.work_id = w.id
            LEFT OUTER JOIN
                series s ON s.id = ws.series_id
            WHERE
                aw.name = 'Hugo Award' and
                ac.name = 'Best Novel'
            ORDER BY
                ac.year DESC,
                wac.status,
                w.title;
        """
        
        var stmt: OpaquePointer?

        do {
            if sqlite3_prepare_v2(conn, sql, -1, &stmt, nil) == SQLITE_OK {
                var prevWorkId = -1;
                var currWorkId = -1;
                var authors = [Author]()
//                var work = Work(id: -1, title: "", imageName: "", authors: authors, awards: [])
                
                while sqlite3_step(stmt) == SQLITE_ROW {
                    let currWorkId = getInt(stmt: stmt, colIndex: 0)
                    let awardYear = getInt(stmt: stmt, colIndex: 4)
                    let authorId = getInt(stmt: stmt, colIndex: 7)
                    let firstName = try getString(stmt: stmt, colIndex: 8)
                    let middleName = try getString(stmt: stmt, colIndex: 9)
                    let lastName = try getString(stmt: stmt, colIndex: 10)

                    if currWorkId != prevWorkId {
                        if let firstName = firstName, let lastName = lastName {
                            authors.append(Author(id: authorId,
                                                  firstName: firstName,
                                                  middleName: middleName,
                                                  lastName: lastName))
                        }
                        
                        if let awardStatus = try getString(stmt: stmt, colIndex: 6) {
                            let award = Award(id: 1,
                                              type: "Hugo",
                                              name: "Best Novel",
                                              year: awardYear,
                                              status: awardStatus)
                            
                            if let title = try getString(stmt: stmt, colIndex: 1),
                               let imageName = try getString(stmt: stmt, colIndex: 2) {
                                
                                if let seriesName = try getString(stmt: stmt, colIndex: 12) {
                                    let seriesId = getInt(stmt: stmt, colIndex: 11)
                                    let seriesOrdinalName = try getString(stmt: stmt, colIndex: 13)
                                    let series = Series(id: seriesId, name: seriesName)
                                    
                                    works.append(Work(id: currWorkId,
                                                      title: title,
                                                      imageName: imageName,
                                                      authors: authors,
                                                      awards: [award],
                                                      series: series,
                                                      seriesOrdinalName: seriesOrdinalName))
                                }
                                else {
                                    works.append(Work(id: currWorkId,
                                                      title: title,
                                                      imageName: imageName,
                                                      authors: authors,
                                                      awards: [award]))
                                }

                                authors = [Author]()
                            }
                        }
                    }
                    else {
                        if let firstName = firstName, let lastName = lastName {
                            authors.append(Author(id: authorId,
                                                  firstName: firstName,
                                                  middleName: middleName,
                                                  lastName: lastName))
                        }
                    }
                    
                    prevWorkId = currWorkId
                }
            }
        } catch {
            print(error)
        }
        
        return works
    }
    
    func getHugoWinners() -> [Work] {
        var works = [Work]()
        
        let sql = """
            select
                aw.name as award_name,
                ac.year as award_year,
                ac.name as award_category,
                w.id as work_id,
                w.title as work_title,
                case when wac.status = 1 then 'Winner'
                     when wac.status = 2 then 'Finalist'
                end as award_status,
                a.id as author_id,
                a.first_name as author_first_name,
                a.middle_name as author_middle_name,
                a.last_name as author_last_name
            from
                award aw
            left outer join
                award_category ac on ac.award_id = aw.id
            left outer join
                work_award_category wac on wac.award_category_id = ac.id
            left outer join
                work w on w.id = wac.work_id
            left outer join
                work_author wa on wa.work_id = w.id
            left outer join
                author a on a.id = wa.author_id
            where
                aw.name = 'Hugo Award' and
                ac.name = 'Best Novel'
            order by
                ac.year,
                wac.status,
                w.title;
        """
        
        var stmt: OpaquePointer?

        do {
            if sqlite3_prepare_v2(conn, sql, -1, &stmt, nil) == SQLITE_OK {
                var prevWorkId = -1;
                var currWorkId = -1;
                var authors = [Author]()
                
                while sqlite3_step(stmt) == SQLITE_ROW {
                    let currWorkId = getInt(stmt: stmt, colIndex: 0)
                    let authorId = getInt(stmt: stmt, colIndex: 2)
                    let firstName = try getString(stmt: stmt, colIndex: 3)
                    let middleName = try getString(stmt: stmt, colIndex: 4)
                    let lastName = try getString(stmt: stmt, colIndex: 5)

                    if currWorkId != prevWorkId {
                        if let firstName = firstName, let lastName = lastName {
                            authors.append(Author(id: authorId,
                                                  firstName: firstName,
                                                  middleName: middleName,
                                                  lastName: lastName))
                        }
                        
                        if let title = try getString(stmt: stmt, colIndex: 1) {
                            works.append(Work(id: currWorkId,
                                              title: title,
                                              imageName: "",
                                              authors: authors,
                                              awards: []))
                            authors = [Author]()
                        }
                    }
                    else {
                        if let firstName = firstName, let lastName = lastName {
                            authors.append(Author(id: authorId,
                                                  firstName: firstName,
                                                  middleName: middleName,
                                                  lastName: lastName))
                        }
                    }
                    
                    prevWorkId = currWorkId
                }
            }
        } catch {
            print(error)
        }
        
        return works
    }
}
