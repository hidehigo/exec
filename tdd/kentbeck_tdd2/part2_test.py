from part2 import WasRun, TestCase

test = WasRun("testMethod")
print test.wasRun
test.run()
print test.wasRun

class TestCaseTest(TestCase):
  def setUp(self):
    self.test = WasRun("testMethod")
  def testRunning(self):
    self.test.run()
    assert(test.wasRun)
  def testSetUp(self):
    self.test.run()
    assert("setUp " == self.test.log)
TestCaseTest("testRunning").run()
TestCaseTest("testSetUp").run()


