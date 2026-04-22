<script setup lang="ts">
  import Layout from '@/layouts/Default.vue'
  import type { TableColumn } from '@nuxt/ui'
  import { getPaginationRowModel, type Row } from '@tanstack/table-core'
  import { useFetch } from '@vueuse/core'
  import { upperFirst } from 'scule'
  import { h, ref, resolveComponent, useTemplateRef, watch } from 'vue'
  import type { Product, User } from '../types'
  import { list } from '@/routes/products'

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
  })

  const columnFilters = ref([
    {
      id: 'product',
      value: '',
    },
  ])
  const columnVisibility = ref()
  // const rowSelection = ref({ 0: true })

  const { data, isFetching } = useFetch(list().url, { initialData: [] }).json<Product[]>()

  function getRowItems (row: Row<Product>) {
    return [
      {
        type: 'label',
        label: 'Actions',
      },
      {
        label: 'Copy product ID',
        icon: 'i-lucide-copy',
        onSelect () {
          navigator.clipboard.writeText(row.original.id.toString())
          toast.add({
            title: 'Copied to clipboard',
            description: 'Product ID copied to clipboard',
          })
        },
      },
      {
        type: 'separator',
      },
      {
        label: 'View product details',
        icon: 'i-lucide-list',
      },
      {
        label: 'View product payments',
        icon: 'i-lucide-wallet',
      },
      {
        type: 'separator',
      },
      {
        label: 'Delete product',
        icon: 'i-lucide-trash',
        color: 'error',
        onSelect () {
          toast.add({
            title: 'Product deleted',
            description: 'The product has been deleted.',
          })
        },
      },
    ]
  }

  const columns: TableColumn<Product>[] = [
    {
      accessorKey: 'id',
      header: 'Code',
      cell: ({ row }) => `#${row.original.id}`,
    },
    {
      accessorKey: 'product',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Product',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
      cell: ({ row }) => {
        const color = row.index % 2 === 0 ? 'primary' : 'secondary'
        return h('div', { class: 'flex items-center justify-start align-center gap-3' }, [
          h('div', { class: 'w-20  h-10 p-0 rounded-lg flex items-center justify-end' }, [
            h(UIcon, { name: 'i-lucide-box', class: `text-${color} opacity-40 size-7` }),
          ]),
          h('span', { class: 'block font-medium text-highlighted break-normal text-wrap w-50' }, row.original.product)
        ])
      },
    },
    {
      accessorKey: 'category',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Category',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
      cell: ({ row }) => {
        return h(UBadge, { class: 'capitalize', variant: 'subtle', color: 'error', icon: 'i-lucide-columns-3' }, () => `${row.original.category}`)
      },
    },
    {
      accessorKey: 'size',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Size',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
    },
    {
      accessorKey: 'brand',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Brand',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
      cell: ({ row }) => {
        return h(UBadge, { class: 'capitalize', variant: 'subtle', color: 'info', icon: 'i-lucide-target' }, () => `${row.original.brand}`)
      },
    },
    {
      accessorKey: 'price',
      header: ({ column }) => {
        const isSorted = column.getIsSorted()
        return h(UButton, {
          color: 'neutral',
          variant: 'ghost',
          label: 'Price',
          icon: isSorted ? (isSorted === 'asc' ? 'i-lucide-arrow-up-narrow-wide' : 'i-lucide-arrow-down-wide-narrow') : 'i-lucide-arrow-up-down',
          class: '-mx-2.5',
          onClick: () => column.toggleSorting(column.getIsSorted() === 'asc'),
        })
      },
      cell: ({ row }) => {
        return h(UBadge, { class: 'capitalize', variant: 'subtle', color: 'primary', icon: 'i-lucide-wallet' }, () => formatter.format(row.original.price))
      },
    },
  ]

  const statusFilter = ref('all')

  const pagination = ref({
    pageIndex: 0,
    pageSize: 30,
  })
</script>

<template>
  <UDashboardPanel id="products">
    <template #header>
      <UDashboardNavbar title="Products">
        <template #leading>
          <UDashboardSidebarCollapse as="button" :disabled="false" />
        </template>
      </UDashboardNavbar>
    </template>

    <template #body>
      <div class="flex flex-wrap items-center justify-between gap-1.5">
        <UInput :model-value="table?.tableApi?.getColumn('product')?.getFilterValue() as string" class="max-w-sm"
          icon="i-lucide-search" placeholder="Filter products..."
          @update:model-value="table?.tableApi?.getColumn('product')?.setFilterValue($event)" />

        <div class="flex flex-wrap items-center gap-1.5">
          <CustomersDeleteModal :count="table?.tableApi?.getFilteredSelectedRowModel().rows.length">
            <UButton v-if="table?.tableApi?.getFilteredSelectedRowModel().rows.length" label="Delete" color="error"
              variant="subtle" icon="i-lucide-trash">
              <template #trailing>
                <UKbd>
                  {{ table?.tableApi?.getFilteredSelectedRowModel().rows.length }}
                </UKbd>
              </template>
            </UButton>
          </CustomersDeleteModal>


          <UDropdownMenu :items="table?.tableApi
              ?.getAllColumns()
              .filter((column: any) => column.getCanHide())
              .map((column: any) => ({
                label: upperFirst(column.id),
                type: 'checkbox' as const,
                checked: column.getIsVisible(),
                onUpdateChecked (checked: boolean) {
                  table?.tableApi?.getColumn(column.id)?.toggleVisibility(!!checked)
                },
                onSelect (e?: Event) {
                  e?.preventDefault()
                },
              }))
            " :content="{ align: 'end' }">
            <UButton label="Display" color="neutral" variant="outline" trailing-icon="i-lucide-settings-2" />
          </UDropdownMenu>
        </div>
      </div>

      <UTable ref="table" v-model:column-filters="columnFilters" v-model:column-visibility="columnVisibility"
        v-model:row-selection="rowSelection" v-model:pagination="pagination" :pagination-options="{
          getPaginationRowModel: getPaginationRowModel(),
        }" class="shrink-0" :data="data ?? []" :columns="columns" :loading="isFetching" :ui="{
          base: 'table-fixed border-separate border-spacing-0',
          thead: '[&>tr]:bg-elevated/50 [&>tr]:after:content-none',
          tbody: '[&>tr]:last:[&>td]:border-b-0',
          th: 'py-2 first:rounded-l-lg last:rounded-r-lg border-y border-default first:border-l last:border-r',
          td: 'border-b border-default',
        }" />

      <div class="mt-auto flex items-center justify-between gap-3 border-t border-default pt-4">
        <div class="text-sm text-muted">
          {{ table?.tableApi?.getFilteredSelectedRowModel().rows.length || 0 }} of
          {{ table?.tableApi?.getFilteredRowModel().rows.length || 0 }} row(s) selected.
        </div>

        <div class="flex items-center gap-1.5">
          <UPagination :default-page="(table?.tableApi?.getState().pagination.pageIndex || 0) + 1"
            :items-per-page="table?.tableApi?.getState().pagination.pageSize"
            :total="table?.tableApi?.getFilteredRowModel().rows.length"
            @update:page="(p: number) => table?.tableApi?.setPageIndex(p - 1)" />
        </div>
      </div>
    </template>
  </UDashboardPanel>
</template>
