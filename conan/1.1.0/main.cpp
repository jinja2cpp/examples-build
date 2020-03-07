#include <iostream>
#include <string>

#include "gtest/gtest.h"

#include <jinja2cpp/template.h>

using namespace jinja2;

TEST(BasicTests, PlainSingleLineTemplateProcessing)
{
    std::string source = "Hello World from Parser!";

    Template tpl;
    ASSERT_TRUE(!!tpl.Load(source));

    std::string result = tpl.RenderAsString(ValuesMap{}).value();
    std::cout << result << std::endl;
    std::string expectedResult = "Hello World from Parser!";
    EXPECT_STREQ(expectedResult.c_str(), result.c_str());
}
