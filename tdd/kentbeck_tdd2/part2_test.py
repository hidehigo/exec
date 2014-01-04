from part2 import WasRun, TestCase

test = WasRun("testMethod")
print test.wasRun
test.run()
print test.wasRun

class TestCaseTest(TestCase):
  def setUp(self):
    self.test = WasRun("testMethod")
  def testTemplateMethod(self):
    self.test.run()
    assert("setUp testMethod " == self.test.log)
TestCaseTest("testTemplateMethod").run()


