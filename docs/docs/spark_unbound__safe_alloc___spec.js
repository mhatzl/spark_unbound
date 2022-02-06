GNATdoc.Documentation = {
  "label": "Spark_Unbound.Safe_Alloc",
  "qualifier": "",
  "summary": [
    {
      "kind": "paragraph",
      "children": [
        {
          "kind": "span",
          "text": "Package for save heap allocation.\n"
        }
      ]
    }
  ],
  "description": [
    {
      "kind": "paragraph",
      "children": [
        {
          "kind": "span",
          "text": "Package containing two generic packages for safe heap allocation.\n"
        },
        {
          "kind": "span",
          "text": "No `Storage_Error` is propagated if the heap allocation failed.\n"
        }
      ]
    }
  ],
  "entities": [
    {
      "entities": [
        {
          "label": "Definite",
          "href": "../docs/spark_unbound__safe_alloc___definite___spec.html#L19C12",
          "qualifier": "",
          "summary": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Generic package for safe heap allocation of type `T` whose size is known at compile time.\n"
                }
              ]
            }
          ],
          "description": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Generic package for safe heap allocation of type `T` whose size is known at compile time.\n"
                },
                {
                  "kind": "span",
                  "text": "Type `T_Acc` is used to access the allocated instance of type `T`.\n"
                }
              ]
            }
          ]
        },
        {
          "label": "Arrays",
          "href": "../docs/spark_unbound__safe_alloc___arrays___spec.html#L45C12",
          "qualifier": "",
          "summary": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Generic package for safe heap allocation of array `Array_Type`.\n"
                }
              ]
            }
          ],
          "description": [
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Generic package for safe heap allocation of array `Array_Type`.\n"
                },
                {
                  "kind": "span",
                  "text": "Type `Array_Type_Acc` is used to access the allocated instance of array `Array_Type`.\n"
                }
              ]
            },
            {
              "kind": "paragraph",
              "children": [
                {
                  "kind": "span",
                  "text": "Note: The allocated array is NOT initialized.\n"
                }
              ]
            }
          ]
        }
      ],
      "label": "Nested packages"
    }
  ]
};