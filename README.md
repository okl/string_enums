# string_enums

StringEnum is a concern that makes it easy to work with enums. Include the module, then invoke
the class method string_enum with the attribute name followed by the list of valid values. This will
add checks, writers, and constants for each value.

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

