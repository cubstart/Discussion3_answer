//
//  Discussion3Test.swift
//  Discussion3Test
//
//  Created by Dylan Chhum on 2/20/25.
//

import Testing

struct Discussion3Test {

    @Test func testSorted()  {
        let inputArray = [5, 3, 9, 1, 4]
        let expected = [9, 5, 4, 3, 1]
        let result = sortedOut(arry: inputArray)
        
        #expect(result == expected)
    }
    
    @Test func testOSKI() {
        let OCTO = ASUC()
        OCTO.money = 150000
        let RSF = ASUC()
        RSF.money = 80000
        let TANG = ASUC()
        TANG.money = 200000
        let inputPrograms = [OCTO, RSF, TANG]
        
        let result = OSKI(agency: inputPrograms)
        #expect(result.contains( where: {
            $0.money > 100000
        }))
    }
    
    @Test func testXSKI() {
        let OCTO = ASUC()
        OCTO.money = 100000
        OCTO.important = true
        let RSF = ASUC()
        RSF.money = 500
        RSF.important = true
        let inputProgram = [OCTO, RSF]
        
        let result = XSKI(programs: inputProgram)
        
        #expect(result == (500 * 500) + (100000 * 100000))
        
        #expect(inputProgram.allSatisfy ({  !$0.important }))
    }

}
