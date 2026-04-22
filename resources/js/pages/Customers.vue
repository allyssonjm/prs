<script setup lang="ts">
  import Layout from '@/layouts/Default.vue'
  import type { TableColumn } from '@nuxt/ui'
  import { getPaginationRowModel, type Row } from '@tanstack/table-core'
  import { useFetch } from '@vueuse/core'
  import { upperFirst } from 'scule'
  import { h, ref, resolveComponent, useTemplateRef, watch } from 'vue'
  import type { Customer, User } from '../types'
  import { list } from '@/routes/customers'

  defineOptions({ layout: Layout })

  const UAvatar = resolveComponent('UAvatar')
  const UIcon = resolveComponent('UIcon')
  const UButton = resolveComponent('UButton')
  const UBadge = resolveComponent('UBadge')
  const UDropdownMenu = resolveComponent('UDropdownMenu')
  const UCheckbox = resolveComponent('UCheckbox')

  const toast = useToast()
  const table = useTemplateRef('table')

  const formatter = new Intl.NumberFormat('pt-BR', {
    style: 'currency',
    currency: 'BRL',
  });

  const columnFilters = ref([
    {
      id: 'name',
      value: '',
    },
  ])
  const columnVisibility = ref()
  // const rowSelection = ref({ 0: true })

  const { data, isFetching } = useFetch(list().url, { initialData: [] }).json<Customer[]>()

  function getRowItems(row: Row<Customer>) {
    return [
      {
        type: 'label',
        label: 'Actions',
      },
      {
        label: 'Copy customer ID',
        icon: 'i-lucide-copy',
        onSelect() {
          navigator.clipboard.writeText(row.original.id.toString())
          toast.add({
            title: 'Copied to clipboard',
            description: 'Customer ID copied to clipboard',
          })
        },
      },
      {
        type: 'separator',
      },
      {
        label: 'View customer details',
        icon: 'i-lucide-list',
      },
      {
        label: 'View customer payments',
        icon: 'i-lucide-wallet',
      },
      {
        type: 'separator',
      },
      {
        label: 'Delete customer',
        icon: 'i-lucide-trash',
        color: 'error',
        onSelect() {
          toast.add({
            title: 'Customer deleted',
            description: 'The customer has been deleted.',
          })
        },
      },
    ]
  }

  const columns: TableColumn<Customer>[] = [
    {
      accessorKey: 'id',
      header: '#',
    },
    {
      accessorKey: 'name',
      header: 'Name',
      cell: ({ row }) => {
        return h('div', { class: 'flex items-center gap-3' }, [
          h(UAvatar, {
            src: row.original.avatar,
            alt: row.original.name,
            loading: 'lazy',
            size: 'xl',
          }),
          h('div', undefined, [h('p', { class: 'font-medium text-highlighted' }, row.original.name), h('p', { class: '' }, `@${row.original.name.replace(/\s/g, '.').toLocaleLowerCase(  )}`)]),
        ])
      },
    },
    {
      accessorKey: 'age',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Age',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
      cell: ({ row }) => {
        return h(UBadge, { class: 'capitalize', variant: 'subtle', color: 'info', icon:'i-lucide-cake' }, () => ` ${row.original.age} years old`)
      },
    },
    {
      accessorKey: 'total_purchases',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Total Purchases',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
      cell: ({ row }) => {
        return h(UBadge, { class: 'capitalize', variant: 'subtle', color: 'primary', icon:'i-lucide-wallet' }, () => formatter.format(row.original.total_purchases))
      },
    },
  ]

  const statusFilter = ref('all')

  watch(
    () => statusFilter.value,
    (newVal) => {
      if (!table?.value?.tableApi) return

      const statusColumn = table.value.tableApi.getColumn('status')
      if (!statusColumn) return

      if (newVal === 'all') {
        statusColumn.setFilterValue(undefined)
      } else {
        statusColumn.setFilterValue(newVal)
      }
    },
  )

  const pagination = ref({
    pageIndex: 0,
    pageSize: 30,
  })
</script>

<template>
  <UDashboardPanel id="customers">
    <template #header>
      <UDashboardNavbar title="Customers">
        <template #leading>
          <UDashboardSidebarCollapse as="button" :disabled="false" />
        </template>

        <template #right>
          <CustomersAddModal />
        </template>
      </UDashboardNavbar>
    </template>

    <template #body>
      <div class="flex flex-wrap items-center justify-between gap-1.5">
        <UInput
          :model-value="table?.tableApi?.getColumn('name')?.getFilterValue() as string"
          class="max-w-sm"
          icon="i-lucide-search"
          placeholder="Filter names..."
          @update:model-value="table?.tableApi?.getColumn('name')?.setFilterValue($event)"
        />

        <div class="flex flex-wrap items-center gap-1.5">
          <CustomersDeleteModal :count="table?.tableApi?.getFilteredSelectedRowModel().rows.length">
            <UButton
              v-if="table?.tableApi?.getFilteredSelectedRowModel().rows.length"
              label="Delete"
              color="error"
              variant="subtle"
              icon="i-lucide-trash"
            >
              <template #trailing>
                <UKbd>
                  {{ table?.tableApi?.getFilteredSelectedRowModel().rows.length }}
                </UKbd>
              </template>
            </UButton>
          </CustomersDeleteModal>

          
          <UDropdownMenu
            :items="
              table?.tableApi
                ?.getAllColumns()
                .filter((column: any) => column.getCanHide())
                .map((column: any) => ({
                  label: upperFirst(column.id),
                  type: 'checkbox' as const,
                  checked: column.getIsVisible(),
                  onUpdateChecked(checked: boolean) {
                    table?.tableApi?.getColumn(column.id)?.toggleVisibility(!!checked)
                  },
                  onSelect(e?: Event) {
                    e?.preventDefault()
                  },
                }))
            "
            :content="{ align: 'end' }"
          >
            <UButton label="Display" color="neutral" variant="outline" trailing-icon="i-lucide-settings-2" />
          </UDropdownMenu>
        </div>
      </div>

      <UTable
        ref="table"
        v-model:column-filters="columnFilters"
        v-model:column-visibility="columnVisibility"
        v-model:row-selection="rowSelection"
        v-model:pagination="pagination"
        :pagination-options="{
          getPaginationRowModel: getPaginationRowModel(),
        }"
        class="shrink-0"
        :data="data ?? []"
        :columns="columns"
        :loading="isFetching"
        :ui="{
          base: 'table-fixed border-separate border-spacing-0',
          thead: '[&>tr]:bg-elevated/50 [&>tr]:after:content-none',
          tbody: '[&>tr]:last:[&>td]:border-b-0',
          th: 'py-2 first:rounded-l-lg last:rounded-r-lg border-y border-default first:border-l last:border-r',
          td: 'border-b border-default',
        }"
      />

      <div class="mt-auto flex items-center justify-between gap-3 border-t border-default pt-4">
        <div class="text-sm text-muted">
          {{ table?.tableApi?.getFilteredSelectedRowModel().rows.length || 0 }} of
          {{ table?.tableApi?.getFilteredRowModel().rows.length || 0 }} row(s) selected.
        </div>

        <div class="flex items-center gap-1.5">
          <UPagination
            :default-page="(table?.tableApi?.getState().pagination.pageIndex || 0) + 1"
            :items-per-page="table?.tableApi?.getState().pagination.pageSize"
            :total="table?.tableApi?.getFilteredRowModel().rows.length"
            @update:page="(p: number) => table?.tableApi?.setPageIndex(p - 1)"
          />
        </div>
      </div>
    </template>
  </UDashboardPanel>
</template>
