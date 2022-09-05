#include <istream>
#include <stdio.h>
#include <fstream>
#include <vector>
#include <time.h>

using namespace std;

int main()
{
   string line;
   vector<string> lines;

   // To generating random values each interation
   srand(time(0));

   // Opening the File
   ifstream file("Quotes.txt");

   // Count the number of lines and store the lines in `lines` vector
   int line_count = 0;
   while (getline(file, line))
   {
      line_count++;
      lines.push_back(line);
   }

   // Generate the random number between 0 and number of lines
   int random_number = rand() % line_count;

   string cmd = "notify-send ";
   string quote = lines[random_number];
   string notificationCmd = " && play -n synth 1 pluck A3 vol -10dB repeat 1";
   string quotation = "\"";
   string str_obj(cmd + quotation + quote + quotation + notificationCmd);

   char *value = &str_obj[0];

   system(value);
   // printf(value);
}
