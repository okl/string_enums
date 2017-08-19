# string_enums

StringEnums is a concern that makes it easy to work with enums. Include the module, then invoke
the class method string_enum with the attribute name followed by the list of valid values. This will
add checks, writers, and constants for each value.


## Usage
```
class Person < ActiveRecord::Base
  include StringEnums
  string_enum status: %w(living dead reviving zombie permanently_dead)
end
```

```
class FilesystemObject < ActiveRecord::Base
  include StringEnums
  string_enum kind: ['file', 'folder', 'symbolic link']
end
```


## Example
A class declares `string_enum status: ['pending', 'in progress', 'completed']`, which adds
the following...

... checks:
* `pending?`
* `in_progress?`
* `completed?`

... and writers:
* `mark_pending`
* `mark_in_progress`
* `mark_completed`

... and constants:
* `STATUS_PENDING`
* `STATUS_IN_PROGRESS`
* `STATUS_COMPLETED`

